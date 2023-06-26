//
//  ScrollViewReaderModel.swift
//  TestUI
//
//  Created by 精灵要跳舞 on 2023/6/26.
//

import SwiftUI

struct ScrollViewReaderModel: Identifiable {
    var id = UUID()
    var imageName: String
    
    static let sampleModels = (1...9).map {
        ScrollViewReaderModel(imageName: "IMG_\($0%5+1)")
    }
//    static let sampleModels = [ScrollViewReaderModel(imageName: "IMG_1"),ScrollViewReaderModel(imageName: "IMG_2"),ScrollViewReaderModel(imageName: "IMG_3"),ScrollViewReaderModel(imageName: "IMG_4"),ScrollViewReaderModel(imageName: "IMG_5")]
}
