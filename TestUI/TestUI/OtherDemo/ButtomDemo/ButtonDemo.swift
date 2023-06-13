//
//  ButtonDemo.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/12.
//

import SwiftUI

struct ButtonOriginStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

struct ButtonDemo: View {
    var body: some View {
        VStack(spacing: 15) {
            ButtonView(title: "微信登录", backgroundColor:Color(red: 88/255, green: 224/255, blue: 133/255)) {
                print("点击了微信登录")
            }
            Button {
                print("点击了Apple登录")
            } label: {
                HStack(spacing: 8) {
                    Image(uiImage: UIImage(named: "pingguo")!)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 22, maxHeight: 20)
                    Text("Apple登录")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .padding(.vertical)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color(red: 51/255, green: 51/255, blue: 51/255))
                .cornerRadius(5)
                .padding(.horizontal, 20)
                
            }
            
            HStack {
                IconImage(imageUrl: "weixin") {
                    print("weixin")
                }
                .padding(.leading, 16)
                Spacer()
                IconImage(imageUrl: "weibo") {
                    print("weibo")
                }
                Spacer()
                IconImage(imageUrl: "QQ") {
                    print("QQ")
                }
                .padding(.trailing, 16)
            }
            .padding(.horizontal, 20)
        }

    }
}

struct ButtonDemo_Previews: PreviewProvider {
    static var previews: some View {
        ButtonDemo()
    }
}

struct ButtonView: View {
    let title: String
    let backgroundColor: Color
    let action: ()->()
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(backgroundColor)
                .foregroundColor(.white)
                .font(.system(size: 14))
                .cornerRadius(5)
                .padding(.horizontal, 20)
        }
    }
}

struct IconImage: View {
    let imageUrl: String
    let action: ()->()
    var body: some View {
        Button {
            action()
        } label: {
            Image(uiImage: UIImage(named: imageUrl)!)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 35, maxHeight: 32)
                .clipShape(Circle())
        }

    }
}
