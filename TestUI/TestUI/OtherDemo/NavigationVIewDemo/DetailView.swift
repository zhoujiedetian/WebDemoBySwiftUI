//
//  DetailView.swift
//  TestUI
//
//  Created by 精灵要跳舞 on 2023/6/12.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    let message: Message
    var body: some View {
        VStack {
            Image(uiImage: UIImage(named: message.imageUrl)!)
            Text(message.title)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    self.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.gray)
                }

                
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(message: Message(imageUrl: "yuyin", title: "这是语音"))
    }
}
