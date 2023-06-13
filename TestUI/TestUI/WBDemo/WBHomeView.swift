//
//  WBHomeView.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/5.
//

import SwiftUI

struct WBHomeView: View {
    
    @State var isLeft: CGFloat = 0
    
    init() {
        //        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        NavigationView() {
            GeometryReader {
                gr in
                WBScrollViewController(pageWidth: gr.size.width, contentSize: CGSize(width: gr.size.width * 2, height: gr.size.height), isLeft: self.$isLeft) {
                    HStack(spacing: 0) {
                        WBPostListView(category: .recommand)
                            .frame(width: UIScreen.main.bounds.size.width)
                        WBPostListView(category: .hot)
                            .frame(width: UIScreen.main.bounds.size.width)
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarItems(leading: WBNavigationBar(isLeft: $isLeft))
        }
    }
}

struct WBHomeView_Previews: PreviewProvider {
    static var previews: some View {
        WBHomeView().environmentObject(WBUserData())
    }
}
