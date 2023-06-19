//
//  SearchBarDemo.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/19.
//

import SwiftUI

struct SearchBarDemo: View {
    @State var text: String
    var body: some View {
        TextField("搜你想看的", text: $text)
    }
}

struct SearchBarDemo_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarDemo(text: "")
    }
}
