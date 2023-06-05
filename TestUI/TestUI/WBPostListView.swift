//
//  WBPostListView.swift
//  TestUI
//
//  Created by zhoujie on 2023/5/31.
//

import SwiftUI

struct WBPostListView: View {
    
    var category: PostListCategory = .recommand
    
    var postList: PostList {
        switch category {
        case .recommand:
            return loadPostList("PostListData_recommend_1.json")
        case .hot:
            return loadPostList("PostListData_hot_1.json")
        }
    }
    
    
    
    var body: some View {
        List {
            ForEach(postList.list) { post in
                
                ZStack {
                    WBPostCell(post: post)
                    NavigationLink(destination: WBPostDetailView(post: post)) {
                        EmptyView()
                    }
//                    .hidden()
                }
                .listRowInsets(EdgeInsets())
            }.listRowSeparator(.hidden)
        }.listStyle(.plain)
    }
}

struct WBPostListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            WBPostListView()
                .navigationTitle("微博")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
