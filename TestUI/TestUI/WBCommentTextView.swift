//
//  WBCommentTextView.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/7.
//

import SwiftUI

struct WBCommentTextView: UIViewRepresentable {
    @Binding var text: String
    
    var beginEditingOnAppear : Bool
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> some UIView {
        let textView = UITextView()
        textView.backgroundColor = .systemGray6
        textView.font = .systemFont(ofSize: 18)
        textView.textContainerInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        textView.delegate = context.coordinator
        textView.text = text
        return textView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if beginEditingOnAppear,
           !context.coordinator.didBecameFirstResponder,
           !uiView.isFirstResponder {
            context.coordinator.didBecameFirstResponder = true
            uiView.becomeFirstResponder()
        }
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: WBCommentTextView
        var didBecameFirstResponder: Bool = false
        init(parent: WBCommentTextView) {
            self.parent = parent
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
    }
}


