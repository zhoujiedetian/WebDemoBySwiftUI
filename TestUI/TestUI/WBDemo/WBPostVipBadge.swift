//
//  WBPostVipBadge.swift
//  TestUI
//
//  Created by zhoujie on 2023/5/31.
//

import SwiftUI

struct WBPostVipBadge: View {
    let isVip: Bool
    var body: some View {
        Group {
            if isVip {
                Text("V")
                    .bold()
                    .font(.system(size: 11))
                    .frame(width: 15, height: 15)
                    .foregroundColor(.yellow)
                    .background(Color.red)
                    .clipShape(Circle())
                    .overlay{
                        RoundedRectangle(cornerRadius: 7.5)
                            .stroke(Color.white, lineWidth: 1)
                    }
            }
        }
    }
}

struct WBPostVipBadge_Previews: PreviewProvider {
    static var previews: some View {
        WBPostVipBadge(isVip: true)
    }
}
