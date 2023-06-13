//
//  WBPostCell.swift
//  TestUI
//
//  Created by zhoujie on 2023/5/31.
//

import SwiftUI

struct WBPostCell: View {
    let post: Post
    
    @State var isPresentcomment: Bool = false
    
    var bindingPost: Post {
        userData.post(forId: post.id)!
    }
    
    @EnvironmentObject var userData: WBUserData
    
    var body: some View {
        var post = bindingPost
        return VStack(alignment: .leading, spacing: 10){
            HStack(spacing: 5) {
                post.avatarImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay{
                        WBPostVipBadge(isVip: post.vip)
                            .offset(x:16, y:16)
                    }
                VStack(alignment: .leading, spacing: 5) {
                    Text(post.name)
                        .font(.system(size: 12,weight: .bold))
                        .foregroundColor(Color(red: 242/255.0, green: 99/255.0, blue: 4/255.0))
                        .lineLimit(1)
                    Text(post.date)
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                }.padding(.leading, 10)
                
                if !post.isFollowed {
                    Spacer()
                    Button {
                        post.isFollowed = true
                        self.userData.update(post)
                    } label: {
                        Text("关注")
                            .font(.system(size: 14))
                            .foregroundColor(.orange)
                            .frame(width: 50, height: 26)
                            .overlay{
                                RoundedRectangle(cornerRadius: 13)
                                    .stroke(.orange, lineWidth: 1)
                            }
                    }
                }
            }
            Text(post.text)
                .font(.system(size: 17))
            
            if !post.images.isEmpty {
                WBPostImageCell(images: post.images, width: UIScreen.main.bounds.size.width - 30)
            }
            
            Divider()
            
            HStack(spacing: 5) {
                Spacer()
                WBPostCellToolBarButton(image: "message", text: post.commentCountText, color: .black) {
                    print("点击了评论")
                    self.isPresentcomment = true
                }
                .sheet(isPresented: $isPresentcomment) {
                    WBCommentInputView(post: post)
                }
                Spacer()
                WBPostCellToolBarButton(image: post.isLiked ? "heart.fill":"heart", text: post.likeCountText, color: post.isLiked ?.red:.black) {
                    if post.isLiked {
                        post.isLiked = false
                        post.likeCount -= 1
                    }else {
                        post.isLiked = true
                        post.likeCount += 1
                    }
                    self.userData.update(post)
                }
                Spacer()
            }
            
            Rectangle()
                .padding(.horizontal, -15)
                .frame(height: 10)
                .foregroundColor(Color(red: 230/255, green: 230/255, blue: 230/255))
        }
        .padding(.horizontal, 15)
        .padding(.top, 15)
    }
}

struct WBPostCell_Previews: PreviewProvider {
    static var previews: some View {
        let userData = WBUserData()
        WBPostCell(post:
                    userData.recommandPostList.list[2]).environmentObject(userData)
    }
}
