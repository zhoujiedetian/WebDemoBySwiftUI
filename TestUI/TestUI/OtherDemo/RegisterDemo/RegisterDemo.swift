//
//  RegisterDemo.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/20.
//

import SwiftUI

struct RegisterInputView: View {
    var isUserName = false
    var placeholder = ""
    @Binding var content: String
    var body: some View {
        VStack {
            if isUserName {
                TextField(placeholder, text: $content)
                    .font(.system(size: 20, weight: .semibold))
                    .padding(.horizontal)
            }else {
                SecureField(placeholder, text: $content)
                    .font(.system(size: 20, weight: .semibold))
                    .padding(.horizontal)
            }
            
            Divider()
                .padding(.horizontal)
        }
    }
}

struct RegisterInputErrorView: View {
    var text: String
    var body: some View {
        HStack {
            Image(systemName: "exclamationmark.circle.fill")
                .foregroundColor(Color(red: 251/255, green: 128/255, blue: 128/255))
            Text(text)
                .font(.system(.body, design: .rounded))
                .foregroundColor(Color(red: 251/255, green: 128/255, blue: 128/255))
            Spacer()
        }
        .padding(.leading, 10)
    }
}

struct RegisterDemo: View {
    @ObservedObject private var viewModel = RegisterViewModel()
    var body: some View {
        VStack(spacing: 40) {
            VStack {
                RegisterInputView(isUserName: true, placeholder: "用户名", content: $viewModel.username)
                if !viewModel.isUsernameLengthValid {
                    RegisterInputErrorView(text: "用户不存在")
                }
            }
            
            VStack {
                RegisterInputView(isUserName: false, placeholder: "密码", content: $viewModel.password)
                if !viewModel.isPasswordLengthValid {
                    RegisterInputErrorView(text: "密码不正确")
                }
            }
            
            VStack {
                RegisterInputView(isUserName: false, placeholder: "确认密码", content: $viewModel.passwordConfirm)
                if !viewModel.isPasswordConfirmValid {
                    RegisterInputErrorView(text: "两次密码不一致")
                }
            }
            

            Button {
                
            } label: {
                Text("注册")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .font(.system(.body, design: .rounded))
                    .bold()
                    .padding()
                    .background(Color(red: 51/255, green: 51/255, blue: 51/255))
                    .cornerRadius(10)
                    .padding(.horizontal)
            }

        }
        
    }
}

struct RegisterDemo_Previews: PreviewProvider {
    static var previews: some View {
        RegisterDemo()
    }
}
