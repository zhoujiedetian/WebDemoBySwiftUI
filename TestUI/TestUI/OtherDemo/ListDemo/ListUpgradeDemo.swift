//
//  ListUpgradeDemo.swift
//  TestUI
//
//  Created by 精灵要跳舞 on 2023/6/13.
//

import SwiftUI
var messages = [
    Message(imageUrl: "yuyin", title: "这是语音"),
    Message(imageUrl: "youxiang", title: "这是邮箱"),
    Message(imageUrl: "shezhi", title: "这是设置"),
    Message(imageUrl: "dianhua", title: "这是电话")
]

struct ListUpgradeDemo: View {
    @State private var isPresented = false
    var body: some View {
        NavigationView {
            List {
                ForEach(messages) { message in
                    ListCell(imageUrl: message.imageUrl, title: message.title)
                        .contextMenu {
                            Button {
                                self.isPresented.toggle()
                            } label: {
                                HStack {
                                    Text("删除")
                                    Image(systemName: "trash")
                                }
                            }

                        }
                        .confirmationDialog("这是啥", isPresented: $isPresented, titleVisibility: .visible) {
                            Button(role: .destructive, action: {
                                self.delete(message: message)
                            }, label: {
                                Text("确认删除")
                            })
                            Button(role: .cancel, action: {
                                
                            }, label: {
                                Text("取消")
                            })
                        }
                }
                .onDelete { index in
                    messages.remove(atOffsets: index)
                }
                .onMove { index, destination in
                    print(index, destination)
                    messages.move(fromOffsets: index, toOffset: destination)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
    }
    
    func delete(message: Message) {
        if let index = messages.firstIndex(where: { msg in
            msg.id == message.id
        }) {
            messages.remove(at: index)
        }
    }
}

struct ListUpgradeDemo_Previews: PreviewProvider {
    static var previews: some View {
        ListUpgradeDemo()
    }
}
