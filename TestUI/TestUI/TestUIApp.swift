//
//  TestUIApp.swift
//  TestUI
//
//  Created by zhoujie on 2023/5/30.
//

import SwiftUI

@main
struct TestUIApp: App {
    var body: some Scene {
        WindowGroup {
//            WBHomeView().environmentObject(WBUserData())
//            ImageEntry()
            ZHVStackView()
        }
    }
}
