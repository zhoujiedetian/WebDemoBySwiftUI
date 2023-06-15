//
//  SwipeCardDemo.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/14.
//

import SwiftUI

struct SwipeCardDemo: View {
    var items: [SwipeData] = {
        SwipeData.loadData()
    }()
    
    var body: some View {
        VStack {
            TopBarMenu()
            ZStack {
                ForEach(items) { data in
                    SwipeCardView(data: data)
                        .zIndex(self.isTop(data) ? 1 : 0)
                }
            }
            Spacer(minLength: 20)
            BottomBarView()
        }
    }
    
    func isTop(_ data: SwipeData) -> Bool {
        guard let index = items.firstIndex(where: { $0.id == data.id
        })  else { return false }
        return index == 0
    }
}

struct SwipeCardDemo_Previews: PreviewProvider {
    static var previews: some View {
        SwipeCardDemo()
    }
}
