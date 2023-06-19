//
//  TestUIApp.swift
//  TestUI
//
//  Created by zhoujie on 2023/5/30.
//

import SwiftUI

@main
struct TestUIApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
//            WBHomeView().environmentObject(WBUserData())
            CoreDataDemo()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
