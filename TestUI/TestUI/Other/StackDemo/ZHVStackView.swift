//
//  ZHVStackView.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/8.
//

import SwiftUI

struct ZHVStackView: View {
    @State private var isFirstSelected: Bool = true
    @State private var isSecondSelected: Bool = false
    @State private var isThirdSelected: Bool = false
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            STTitleView()
            HStack(spacing: 5) {
                STPriceView(title: "连续包月", price: 18, average: nil, isSelected: isFirstSelected)
                    .onTapGesture {
                        self.isFirstSelected = true
                        self.isSecondSelected = false
                        self.isThirdSelected = false
                    }
                STPriceView(title: "1个月", price: 30, average: nil, isSelected: isSecondSelected)
                    .onTapGesture {
                        self.isFirstSelected = false
                        self.isSecondSelected = true
                        self.isThirdSelected = false
                    }
                STPriceView(title: "12个月", price: 228, average: "¥19.00/月", isSelected: isThirdSelected)
                    .onTapGesture {
                        self.isFirstSelected = false
                        self.isSecondSelected = false
                        self.isThirdSelected = true
                    }
            }
        }
        .padding(.horizontal)

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

struct STTitleView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("会员套餐")
                .fontWeight(.bold)
                .font(.system(size: 24))
            Text("解锁高级功能")
                .fontWeight(.bold)
                .font(.system(size: 24))
        }
    }
}
