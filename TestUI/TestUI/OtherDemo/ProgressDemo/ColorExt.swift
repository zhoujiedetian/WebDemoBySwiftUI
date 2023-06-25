//
//  ColorExt.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/25.
//

import SwiftUI

extension Color {
    public init(extRed: Int, extGreen: Int, extBlue: Int, opacity: Double = 1.0) {
        let redVal = Double(extRed) / 255.0
        let greenVal = Double(extGreen) / 255.0
        let blueVal = Double(extBlue) / 255.0
        self.init(red: redVal, green: greenVal, blue: blueVal)
    }
    
    public static let gradientPink = Color.init(extRed: 210, extGreen: 153, extBlue: 194)
    public static let gradientYellow = Color.init(extRed: 254, extGreen: 219, extBlue: 215)
}
