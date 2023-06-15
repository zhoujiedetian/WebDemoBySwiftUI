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
            SwipeData(name: "图片01", image: "IMG_1"),
            SwipeData(name: "图片02", image: "IMG_2"),
            SwipeData(name: "图片03", image: "IMG_3"),
            SwipeData(name: "图片04", image: "IMG_4"),
            SwipeData(name: "图片05", image: "IMG_5")
        ]
    }
}


