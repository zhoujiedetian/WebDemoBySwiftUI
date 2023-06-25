//
//  LazyGridDemo.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/25.
//

import SwiftUI

struct LazyGridDemo: View {
    private var appleSymbols = ["house.circle", "person.circle", "bag.circle", "location.circle", "bookmark.circle", "gift.circle", "globe.asia.australia.fill", "lock.circle", "pencil.circle", "link.circle"]
    
    private var girdItemLayout = [GridItem(.fixed(100)), GridItem(.fixed(150)), GridItem(.fixed(100))]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: girdItemLayout) {
                ForEach(0...99, id: \.self) {
                    Image(systemName: appleSymbols[$0 % appleSymbols.count])
                        .font(.system(size: 30))
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 80)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct LazyGridDemo_Previews: PreviewProvider {
    static var previews: some View {
        LazyGridDemo()
    }
}
