//
//  SwipeData.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/15.
//

import SwiftUI

struct SwipeData: Identifiable {
    var id = UUID()
    var name: String
    var image: String
}

extension SwipeData {
    static func loadData() -> [SwipeData] {
        return [
            SwipeData(name: "图片01", image: "8697cf1ely8gashxj3b09j20u00u040v.jpg"),
            SwipeData(name: "图片02", image: "d0c21786ly1gavj2c0kcej20c8096dh7.jpg"),
            SwipeData(name: "图片03", image: "6ec3b446jw1e8qgp5bmzyj2050050aa8.jpg"),
            SwipeData(name: "图片04", image: "8a0b5544jw1e8qgp5bmzyj2050050aa8.jpg"),
            SwipeData(name: "图片05", image: "bca7fdafly1gax1gqdg6qj20c80avdgl.jpg")
        ]
    }
}


