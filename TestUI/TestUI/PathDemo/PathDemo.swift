//
//  PathDemo.swift
//  TestUI
//
//  Created by 精灵要跳舞 on 2023/6/12.
//

import SwiftUI

struct PathDemo: View {
    var body: some View {
//        Path() { path in
//            path.move(to: CGPoint(x: 0, y: 0))
//            path.addLine(to: CGPoint(x: 0, y: 100))
//            path.addLine(to: CGPoint(x: 100, y: 100))
//            path.addLine(to: CGPoint(x: 100, y: 0))
//            path.closeSubpath()
//        }
////        .fill(Color.blue)
//        .stroke(Color.blue, lineWidth: 1)
        
//        Path { path in
//            path.move(to: CGPoint(x: 0, y: 50))
//            path.addLine(to: CGPoint(x: 50, y: 50))
//            path.addQuadCurve(to: CGPoint(x: 150, y: 50), control: CGPoint(x: 100, y: 0))
//            path.addLine(to: CGPoint(x: 200, y: 50))
//            path.addLine(to: CGPoint(x: 200, y: 100))
//            path.addLine(to: CGPoint(x: 0, y: 100))
//            path.closeSubpath()
//        }
//        .fill(Color.cyan)
        
        Path { path in
            path.move(to: CGPoint(x: 200, y: 200))
            path.addArc(center: CGPoint(x: 200, y: 200), radius: 100, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
        }
        .fill(Color.cyan)
        
    }
}

struct PathDemo_Previews: PreviewProvider {
    static var previews: some View {
        PathDemo()
    }
}
