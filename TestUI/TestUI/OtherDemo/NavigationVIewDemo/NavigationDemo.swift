//
//  NavigationDemo.swift
//  TestUI
//
//  Created by 精灵要跳舞 on 2023/6/12.
//

import SwiftUI

struct NavigationDemo: View {
    let messages = [
        Message(imageUrl: "yuyin", title: "这是语音"),
        Message(imageUrl: "youxiang", title: "这是邮箱"),
        Message(imageUrl: "shezhi", title: "这是设置"),
        Message(imageUrl: "dianhua", title: "这是电话")
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(messages) { message in
                    NavigationLink(destination: DetailView(message: message)) {
                        ListCell(imageUrl: message.imageUrl, title: message.title)
                    }
                }
            }
                .navigationTitle("这是导航栏")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct NavigationDemo_Previews: PreviewProvider {
    static var previews: some View {
        NavigationDemo()
    }
}
