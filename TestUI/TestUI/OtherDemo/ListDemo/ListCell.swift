//
//  ListCell.swift
//  TestUI
//
//  Created by 精灵要跳舞 on 2023/6/12.
//

import SwiftUI

struct ListCell: View {
    let imageUrl: String
    let title: String
    var body: some View {
        HStack {
            if let image = UIImage(named: imageUrl) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .padding()
                Text(title)
                    .font(.system(size: 17))
                    .fontWeight(.bold)
            }
            
        }
    }
}

struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(imageUrl: "yuyin", title: "这是语音")
    }
}
