//
//  WBCommentInputView.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/7.
//

import SwiftUI

struct WBCommentInputView: View {
    var post: Post
    // 系统自带的环境变量
    @Environment(\.dismiss) private var dismiss
    // 自定义环境变量
    @EnvironmentObject var userData: WBUserData
    @State private var text: String = ""
    
    @ObservedObject private var keyboardResponder = WBKeyBoardResponder()
    
    @State private var isShowEmptyToast: Bool = false
    
    var body: some View {
        VStack(spacing:0) {
            WBCommentTextView(text: $text, beginEditingOnAppear: true)
            HStack {
                Button {
                    dismiss()
                } label: {
                    Text("取消")
                }
                .frame(width: 60, height: 30)
                
                Spacer()
                
                Button {
                    if self.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        self.isShowEmptyToast = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            self.isShowEmptyToast = false
                        }
                        return
                    }
                    var data = post
                    data.commentCount += 1
                    self.userData.update(data)
                    dismiss()
                } label: {
                    Text("发送")
                }
                .frame(width: 60, height: 30)
            }
            .font(.system(size: 18))
            .foregroundColor(.black)
        }
        .overlay{
            Text("评论不能为空")
                .scaleEffect(isShowEmptyToast ? 1 : 0.5)
                .animation(.spring(dampingFraction: 0.5), value: isShowEmptyToast)
                .opacity(isShowEmptyToast ? 1 : 0)
                .animation(.easeInOut, value: isShowEmptyToast)
        }
        .padding(.bottom, keyboardResponder.keyboardHeight)
        .edgesIgnoringSafeArea(keyboardResponder.keyboardIsShow ? .bottom : [])
    }
}

struct WBCommentInputView_Previews: PreviewProvider {
    static var previews: some View {
        WBCommentInputView(post: WBUserData().recommandPostList.list[0])
    }
}
