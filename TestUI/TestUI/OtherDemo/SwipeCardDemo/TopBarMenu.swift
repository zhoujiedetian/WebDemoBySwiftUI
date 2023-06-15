//
//  TopBarMenu.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/15.
//

import SwiftUI

struct TopBarMenu: View {
    var body: some View {
        HStack {
            Image(systemName: "ellipsis.circle")
                .font(.system(size: 30))
            Spacer()
            Image(systemName: "heart.circle")
                .font(.system(size: 30))
        }
        .padding()
    }
}

struct TopBarMenu_Previews: PreviewProvider {
    static var previews: some View {
        TopBarMenu()
    }
}
