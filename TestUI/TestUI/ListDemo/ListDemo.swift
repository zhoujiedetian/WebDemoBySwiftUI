//
//  ListDemo.swift
//  TestUI
//
//  Created by 精灵要跳舞 on 2023/6/12.
//

import SwiftUI

struct Message: Identifiable {
    var imageUrl: String
    var title: String
    var id = UUID()
}

struct ListDemo: View {
    let messages = [
        Message(imageUrl: "yuyin", title: "这是语音"),
        Message(imageUrl: "youxiang", title: "这是邮箱"),
        Message(imageUrl: "shezhi", title: "这是设置"),
        Message(imageUrl: "dianhua", title: "这是电话")
    ]
    var body: some View {
        List {
            ForEach(messages) { message in
                ListCell(imageUrl: message.imageUrl, title: message.title)
            }
        }
        
    }
}

struct ListDemo_Previews: PreviewProvider {
    static var previews: some View {
        ListDemo()
    }
}
