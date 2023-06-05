//
//  WBHomeView.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/5.
//

import SwiftUI

struct WBHomeView: View {
    init() {
//        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        NavigationView() {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    WBPostListView(category: .recommand)
                        .frame(width: UIScreen.main.bounds.size.width)
                    WBPostListView(category: .hot)
                        .frame(width: UIScreen.main.bounds.size.width)
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarItems(leading: WBNavigationBar(isLeft: 0))
        }
    }
}

struct WBHomeView_Previews: PreviewProvider {
    static var previews: some View {
        WBHomeView()
    }
}
