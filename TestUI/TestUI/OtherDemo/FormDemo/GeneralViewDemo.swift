//
//  SettingViewDemo.swift
//  TestUI
//
//  Created by 精灵要跳舞 on 2023/6/13.
//

import SwiftUI

struct GeneralViewDemo: View {
    @State private var selectNumber = 0
    private var airDropDisplayNames = ["接收关闭", "仅限联系人", "所有人"]
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("关于本机")
                    NavigationLink {
                        UpdateViewDemo()
                    } label: {
                        Text("软件更新")
                    }
                }
                Section {
                    Picker(selection: $selectNumber) {
                        ForEach(0..<airDropDisplayNames.count, id: \.self) { i in
                            Text(self.airDropDisplayNames[i])
                        }
                    } label: {
                        Text("隔空投送")
                    }

                    Text("隔空播放与接力")
                    Text("画中画")
                }
                Section {
                    Text("iphone存储空间")
                    Text("后台App刷新")
                }
                Section {
                    Text("日期与时间")
                    Text("键盘")
                    Text("字体")
                    Text("语言与地区")
                    Text("词典")
                }
            }
            .navigationTitle("通用")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct SettingViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        GeneralViewDemo()
    }
}
