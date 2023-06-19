//
//  BannerDetailDemo.swift
//  TestUI
//
//  Created by 精灵要跳舞 on 2023/6/19.
//

import SwiftUI

struct BannerDetailDemo: View {
    
    let imageName: String
    
    var body: some View {
        GeometryReader { gr in
            ScrollView {
                VStack(alignment: .leading, spacing: 5) {
                    Text(self.imageName)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.heavy)
                        .padding(.bottom, 30)
                    
                    Text("今天是6月19号，学习SwiftUI的第二周，有点难度，记得东西太多了，好多记不住，只能每天写一点学习一点")
                        .padding(.bottom, 40)
                    
                    Button {
                        
                    } label: {
                        Text("知道了")
                            .font(.system(.headline, design: .rounded))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(.blue)
                            .cornerRadius(8)
                    }
                }
                .padding()
                .frame(width: gr.size.width, height: gr.size.height, alignment: .topLeading)
                .background(.white)
                .cornerRadius(8)
            }
        }
    }
}

struct BannerDetailDemo_Previews: PreviewProvider {
    static var previews: some View {
        BannerDetailDemo(imageName: "图片01")
    }
}
