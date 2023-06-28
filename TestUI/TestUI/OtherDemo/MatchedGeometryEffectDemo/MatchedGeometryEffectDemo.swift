//
//  SwiftUIView.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/28.
//

import SwiftUI

struct MatchedGeometryEffect: View {
    let menuItems = ["首页", "发现", "关注", "我的"]
    let menuImages = ["house", "paperplane", "heart", "person.2"]
    @State var selectedItem = 0
    
    @Namespace private var Transition
    
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                HStack {
                    ForEach(menuItems.indices, id: \.self) { index in
                        if index == selectedItem {
                            VStack {
                                Image(systemName: menuImages[index]+".fill")
                                    .foregroundColor(Color.blue)
                                    .font(.system(size: 24))
                                
                                
                                Text(menuItems[index])
                                    .padding(.horizontal)
                                    .padding(.vertical, 4)
                                    .foregroundColor(.blue)
                            }
                            .matchedGeometryEffect(id: "menuItem", in: Transition)
                        }else {
                            VStack {
                                Image(systemName: menuImages[index]+".fill")
                                    .foregroundColor(Color(.systemGray4))
                                    .font(.system(size: 24))
                                
                                
                                Text(menuItems[index])
                                    .padding(.horizontal)
                                    .padding(.vertical, 4)
                                    .foregroundColor(Color(.systemGray4))
                            }
                            .onTapGesture {
                                withAnimation(.easeOut) {
                                    selectedItem = index
                                }
                            }
                                
                        }
                        
                    }
                }
                .padding(.horizontal, 30)
                .padding(.top, 10)
                .padding(.bottom, 10)
                .background(Color.white)
                .cornerRadius(60)
                .overlay {
                    RoundedRectangle(cornerRadius: 60)
                        .stroke(Color.init(extRed: 220, extGreen: 223, extBlue: 230), lineWidth: 1)
                }
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometryEffect()
    }
}
