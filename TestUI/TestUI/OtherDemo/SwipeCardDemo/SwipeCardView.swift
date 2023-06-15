//
//  SwipeCardView.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/15.
//

import SwiftUI

struct SwipeCardView: View {
    let data: SwipeData
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(uiImage: UIImage(named: data.image)!)
                .resizable()
                .frame(minWidth: 0, maxWidth: .infinity)
                .cornerRadius(10)
                .padding(.horizontal, 15)
            VStack {
                Text(data.name)
                    .font(.system(.headline, design: .rounded)).fontWeight(.bold)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                    .background(Color.white)
                    .cornerRadius(5)
            }
            .padding([.bottom], 20)
            
        }
        
    }
}

struct SwipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeCardView(data: SwipeData.loadData()[2])
    }
}
