//
//  WBPostCellToolBarButton.swift
//  TestUI
//
//  Created by zhoujie on 2023/5/31.
//

import SwiftUI

struct WBPostCellToolBarButton: View {
    var image: String
    var text: String
    var color: Color
    var action: ()->()
    var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: 5) {
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
                Text(text)
                    .font(.system(size: 15))
            }
            .foregroundColor(color)
        }

    }
}

struct WBPostCellToolBarButton_Previews: PreviewProvider {
    static var previews: some View {
        WBPostCellToolBarButton(image: "heart", text: "点赞", color: .red) {
            print("点击了")
        }
    }
}
