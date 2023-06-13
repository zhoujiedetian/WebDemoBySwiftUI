//
//  WBPostDetailView.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/5.
//

import SwiftUI

struct WBPostDetailView: View {
    let post: Post
    var body: some View {
        List{
            WBPostCell(post: post)
            ForEach(1...10, id: \.self) { i in
                Text("评论\(i)")
            }
        }.listStyle(.plain)
    }
}

struct WBPostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let userData = WBUserData()
        WBPostDetailView(post: userData.recommandPostList.list[0]).environmentObject(userData)
    }
}
