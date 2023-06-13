//
//  WBPostListView.swift
//  TestUI
//
//  Created by zhoujie on 2023/5/31.
//

import SwiftUI

struct WBPostListView: View {
    
    var category: PostListCategory = .recommand
    
    @EnvironmentObject var userData: WBUserData
    
    var body: some View {
        List {
            ForEach(userData.postList(for: category).list) { post in
                ZStack {
                    WBPostCell(post: post)
                    NavigationLink(destination: WBPostDetailView(post: post)) {
//                        EmptyView()
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
            let userData = WBUserData()
            WBPostListView().environmentObject(userData)
                .navigationTitle("微博")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
