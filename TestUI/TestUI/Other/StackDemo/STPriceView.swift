//
//  STPriceView.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/9.
//

import SwiftUI

struct STPriceView: View {
    let title: String
    let price: Int
    let average: String?
    let isSelected: Bool
    var body: some View {
        ZStack {
            VStack( spacing: 8) {
                Text(title)
                    .fontWeight(.bold)
                    .font(.system(size: 17))
                    .foregroundColor(Color.init(red: 190/255, green: 190/255, blue: 190/255))
                Text("¥\(price)")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .foregroundColor(Color.init(red: 239/255, green: 129/255, blue: 112/255))
                if let aver = average {
                    Text(aver)
                        .fontWeight(.bold)
                        .font(.system(size: 17))
                        .foregroundColor(Color.init(red: 190/255, green: 190/255, blue: 190/255))
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 90)
            .padding(.all, 18)
            .background(Color.init(red: 250/255, green: 247/255, blue: 243/255))
            .overlay {
                if self.isSelected {
                    RoundedRectangle(cornerRadius: 6).stroke(Color(red: 202/255, green: 169/255, blue: 106/255), lineWidth: 2)
                }
                
            }
            if self.isSelected {
                Text("首月特惠")
                    .padding(.all, 6)
                    .foregroundColor(.white)
                    .background(Color(red: 202/255, green: 169/255, blue: 106/255))
                    .cornerRadius(8)
                    .offset(y: -65)
            }
        }
    }
}

struct STPriceView_Previews: PreviewProvider {
    static var previews: some View {
        STPriceView(title: "连续包月", price: 18, average: nil, isSelected: false)
    }
}
