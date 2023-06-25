//
//  TextEditorDemo.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/20.
//

import SwiftUI

struct TextEditorDemo: View {
    @State private var message = ""
    @State private var wordCount: Int = 0
    var body: some View {
        ZStack(alignment: .topLeading) {
            ZStack(alignment: .bottomTrailing) {
                TextEditor(text: $message)
                    .font(.system(size: 16))
                    .lineSpacing(20)
                    .textInputAutocapitalization(.words)
                    .autocorrectionDisabled(true)
                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 100)
                    .padding()
                    .onChange(of: message) { newValue in
                        wordCount = newValue.count
                    }
                
             Text("字数：\(wordCount)")
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .padding()
            }
            
            if message.isEmpty {
                Text("请输入内容")
                    .foregroundColor(Color(UIColor.placeholderText))
                    .padding(15)
            }
        }
        .overlay(content: {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
        })
        .padding()
    }
}

struct TextEditorDemo_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorDemo()
    }
}
