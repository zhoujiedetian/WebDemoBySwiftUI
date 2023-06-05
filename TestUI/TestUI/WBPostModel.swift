//
//  WBPostModel.swift
//  TestUI
//
//  Created by zhoujie on 2023/5/31.
//

import SwiftUI

struct PostList: Codable {
    var list: [Post]
}

struct Post: Codable, Identifiable {
    let id: Int
    let avatar: String
    let vip: Bool
    let name: String
    let date: String
    var isFollowed: Bool
    var text: String
    var images: [String]
    var commentCount: Int
    var likeCount: Int
    var isLiked: Bool
}

extension Post {
    var avatarImage: Image {
        return loadImage(avatar)
    }
    
    var commentCountText: String {
        if commentCount <= 0 { return "评论" }
        if commentCount < 1000 { return "\(commentCount)" }
        return String(format: "%.1fk", Double(commentCount/1000))
    }
    
    var likeCountText: String {
        if likeCount <= 0 { return "点赞" }
        if likeCount < 1000 { return "\(likeCount)" }
        return String(format: "%.1fk", Double(likeCount/1000))
    }
}

let postList = loadPostList("PostListData_recommend_1.json")

func loadPostList(_ filePath: String) -> PostList {
    guard let url = Bundle.main.url(forResource: filePath, withExtension: nil) else {
        fatalError("无法获取本地Json")
    }
    guard let data = try? Data.init(contentsOf: url) else {
        fatalError()
    }
    guard let list = try? JSONDecoder().decode(PostList.self, from: data) else {
        fatalError()
    }
    return list
}

func loadImage(_ name: String) -> Image {
    return Image(uiImage: UIImage(named: name)!)
}
