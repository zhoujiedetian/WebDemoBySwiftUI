//
//  ZHVStackView.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/8.
//

import SwiftUI

struct ZHVStackView: View {
    var body: some View {
        VStack(spacing: 8) {
            Text("会员套餐")
            Text("解锁高级")
        }
    }
}

struct ZHVStackView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ZHVStackView()
                .navigationTitle("会员充值")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
