//
//  ImageEntry.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/8.
//

import SwiftUI

private let url = URL(string: "https://github.com/xiaoyouxinqing/PostDemo/blob/392dc6e0c7b5d54a7432bf49e9458c58fbc9f547/PostDemo/Resources/8a0b5544jw1e8qgp5bmzyj2050050aa8.jpg")!

struct ImageEntry: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    SimpleExample(url: url)
                } label: {
                    Text("SimpleExample")
                }
                NavigationLink {
                    WebImageExample(url: url)
                } label: {
                    Text("WebImageExample")
                }
            }
        }
    }
}

struct ImageEntry_Previews: PreviewProvider {
    static var previews: some View {
        ImageEntry()
    }
}
