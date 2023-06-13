//
//  ImageEntry.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/8.
//

import SwiftUI

private let url = URL(string: "https://s1.ax1x.com/2023/06/12/pCZDUkF.jpg")!

struct ImageEntry: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    SimpleExample(url: url)
                } label: {
                    Text("SimpleExample")
                }
//                NavigationLink {
//                    WebImageExample(url: url)
//                } label: {
//                    Text("WebImageExample")
//                }
            }
        }
    }
}

struct ImageEntry_Previews: PreviewProvider {
    static var previews: some View {
        ImageEntry()
    }
}
