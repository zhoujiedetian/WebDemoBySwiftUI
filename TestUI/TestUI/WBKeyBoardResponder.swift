//
//  WBKeyBoardResponder.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/7.
//

import SwiftUI

class WBKeyBoardResponder: ObservableObject {
    @Published var keyboardHeight: CGFloat = 0
    var keyboardIsShow: Bool { keyboardHeight > 0 }
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIWindow.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIWindow.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notifi: Notification) {
        guard let frame = notifi.userInfo?[UIWindow.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        keyboardHeight = frame.height
    }
    
    @objc func keyboardWillHide(_ notifi: Notification) {
        keyboardHeight = 0
    }
}
