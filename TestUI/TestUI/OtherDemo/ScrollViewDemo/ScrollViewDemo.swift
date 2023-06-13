//
//  ScrollViewDemo.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/12.
//

import SwiftUI

struct ScrollViewDemo: View {
    var body: some View {
        ScrollView {
            VStack {
                CardView(imageUrl: "8697cf1ely8gashxj3b09j20u00u040v.jpg", title: "你的能力是否能在全世界通用，如果不能，那么需求重新评估你的能力！")
                CardView(imageUrl: "d0c21786ly1gavj2c0kcej20c8096dh7.jpg", title: "当你判断你的想法是正确的，那么就在今天完成吧！")
                CardView(imageUrl: "6ec3b446jw1e8qgp5bmzyj2050050aa8.jpg", title: "将自身所学回馈社会，不也是一件幸福的事嘛！")
                CardView(imageUrl: "8a0b5544jw1e8qgp5bmzyj2050050aa8.jpg", title: "成功的秘诀是，绝对不要和别人做同样的事！")
            }
        }
    }
}

struct ScrollViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewDemo()
    }
}

struct CardView: View {
    let imageUrl: String
    let title: String
    var body: some View {
        VStack(spacing: 0) {
            Image(uiImage: UIImage(named: imageUrl)!)
                .resizable()
                .scaledToFit()
                .clipped()
            Text(title)
                .font(.system(size: 17))
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top, 10)
                .padding(.horizontal, 16)
                .padding(.bottom, 10)
        }
        .cornerRadius(16)
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(red: 150/255, green: 150/255, blue: 150/255), lineWidth: 1)
        }
        .padding([.top, .horizontal])
    }
}
