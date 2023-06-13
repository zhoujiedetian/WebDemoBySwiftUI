//
//  WBNavigationBar.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/5.
//

import SwiftUI

private let kLableWidth: CGFloat = 60
private let kButtonHeight: CGFloat = 24
private let kStackWidth: CGFloat = UIScreen.main.bounds.size.width * 0.5
struct WBNavigationBar: View {
    
    @Binding var isLeft: CGFloat // 0在左边, 1在右边
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            Button {
                print("left")
            } label: {
                Image(systemName: "camera")
                    .resizable()
                    .scaledToFit()
                    .frame(width: kButtonHeight, height: kButtonHeight)
                    .foregroundColor(.black)
                    .padding(.horizontal, 15)
                    .padding(.top, 5)
            }
            
            Spacer()
            
            VStack(spacing: 3) {
                HStack(spacing: 8) {
                   Text("推荐")
                        .fontWeight(.bold)
                        .frame(width: kLableWidth, height: kButtonHeight)
                        .padding(.top, 5)
                        .opacity(Double(1 - 0.5 * self.isLeft))
                        .onTapGesture {
                            withAnimation {
                                self.isLeft = 0
                            }
                        }
                    
                    Spacer()
                    
                    Text("热门")
                        .fontWeight(.bold)
                        .frame(width: kLableWidth, height: kButtonHeight)
                        .padding(.top, 5)
                        .opacity(Double(0.5 + 0.5 * self.isLeft))
                        .onTapGesture {
                            withAnimation {
                                self.isLeft = 1
                            }
                        }
                }
                .font(.system(size: 20))
                GeometryReader { geometry in
                    RoundedRectangle(cornerRadius: 2)
                        .frame(width: 30, height: 4)
                        .foregroundColor(.orange)
                        .offset(x: isLeft == 0 ? kLableWidth * 0.5 - 30 * 0.5 : geometry.size.width - kLableWidth * 0.5 - 30 * 0.5)
                }
                .frame(height: 6)
                
            }
            .frame(width: kStackWidth)
            
            Spacer()
            
            Button {
                print("right")
            } label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: kButtonHeight, height: kButtonHeight)
                    .foregroundColor(.orange)
                    .padding(.horizontal, 15)
                    .padding(.top, 5)
            }
        }
        .frame(width: UIScreen.main.bounds.size.width)
    }
}

struct WBNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        WBNavigationBar(isLeft: .constant(0))
    }
}
