//
//  UpdateViewDemo.swift
//  TestUI
//
//  Created by 精灵要跳舞 on 2023/6/13.
//

import SwiftUI

struct UpdateViewDemo: View {
    @State private var isDownload: Bool = true
    @State private var isInstall: Bool = false
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Toggle(isOn: $isDownload) {
                        Text("下载iOS更新")
                    }
                    Toggle(isOn: $isInstall) {
                        Text("安装iOS更新")
                    }
                } footer: {
                    Text("下载后在夜间自动安装软件更新，更新安装前您会收到通知，iPhone必须为充电状态并接入Wi-Fi以完成更新。")
                }

            }
            .navigationTitle("自动更新")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct UpdateViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        UpdateViewDemo()
    }
}
