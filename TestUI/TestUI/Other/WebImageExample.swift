//
//  WebImageExample.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/8.
//

import SwiftUI
import Kingfisher

struct WebImageExample: View {
    let url: URL?
    var body: some View {
        let image = UIImage(named: "")!
        KFImage.url(url)
            .placeholder({ Image(uiImage: image) })
            .resizable()
            .scaledToFit()
            .clipped()
    }
}
