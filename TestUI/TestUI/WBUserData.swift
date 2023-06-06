//
//  WBUserData.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/5.
//

import SwiftUI
import Combine

enum PostListCategory {
    case recommand
    case hot
}

class WBUserData: ObservableObject {
    @Published var recommandPostList: PostList = loadPostList("PostListData_recommend_1.json")
    @Published var hotPostList: PostList = loadPostList("PostListData_hot_1.json")
    
    private var recommandDic: [Int: Int] = [:] // key:id, value:index
    private var hotDic: [Int: Int] = [:]
    
    init() {
        for i in 0..<recommandPostList.list.count {
            let post = recommandPostList.list[i]
            recommandDic[post.id] = i
        }
        for j in 0..<hotPostList.list.count {
            let post = hotPostList.list[j]
            hotDic[post.id] = j
        }
    }
}

extension WBUserData {
    func postList(for category: PostListCategory) -> PostList {
        switch category {
        case .recommand:
            return recommandPostList
        case .hot:
            return hotPostList
        }
    }
    
    func post(forId id: Int) -> Post? {
        if let index = recommandDic[id] {
            return recommandPostList.list[index]
        }
        if let index = hotDic[id] {
            return hotPostList.list[index]
        }
        return nil
    }
    
    func update(_ post: Post) {
        if let index = recommandDic[post.id] {
            recommandPostList.list[index] = post
        }
        if let index = hotDic[post.id] {
            hotPostList.list[index] = post
        }
    }
}
