//
//  BottomBarView.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/15.
//

import SwiftUI

struct BottomBarView: View {
    var body: some View {
        HStack {
            Image(systemName: "xmark")
                .font(.system(size: 30))
            Button {
                
            } label: {
                Text("立即选择")
                    .font(.system(.subheadline, design: .rounded)).fontWeight(.bold)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(5)
            }
            .padding(.horizontal, 30)
            Image(systemName: "heart")
                .font(.system(size: 30))
        }
    }
}

struct BottomBarView_Previews: PreviewProvider {
    static var previews: some View {
        BottomBarView()
    }
}
