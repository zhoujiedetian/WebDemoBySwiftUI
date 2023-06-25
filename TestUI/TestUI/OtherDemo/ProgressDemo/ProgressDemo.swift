//
//  ProgressDemo.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/20.
//

import SwiftUI

struct RingShape: Shape {
    var progress: Double = 0.0
    var thickness: CGFloat = 30.0
    var startAngle: Double = -90
    
    var animatableData: Double {
        get { progress }
        set { progress = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPointMake(rect.width / 2.0, rect.height / 2.0), radius: min(rect.width, rect.height) / 2.0, startAngle: .degrees(startAngle), endAngle: .degrees(startAngle + 360 * progress), clockwise: false)
        return path.strokedPath(.init(lineWidth: thickness, lineCap: .round))
    }
}

struct ProgressDemo: View {
    
    var thickness: CGFloat = 30.0
    var width: CGFloat = 250.0
    var startAngle: Double = -90
    @State var progress = 0.0
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(Color(.systemGray6), lineWidth: thickness)
                RingShape(progress: progress, thickness: thickness)
                    .fill(AngularGradient.init(colors: [.gradientPink, .gradientYellow], center: .center, startAngle: .degrees(startAngle), endAngle: .degrees(startAngle + 360 * 0.3)))
            }
            .frame(width: width, height: width)
            .animation(Animation.easeInOut(duration: 1.0), value: progress)
            
            HStack {
                Group {
                    Text("10%")
                        .font(.system(.headline, design: .rounded))
                        .onTapGesture {
                            self.progress = 0.1
                        }
                    Text("50%")
                        .font(.system(.headline, design: .rounded))
                        .onTapGesture {
                            self.progress = 0.5
                        }
                    Text("100%")
                        .font(.system(.headline, design: .rounded))
                        .onTapGesture {
                            self.progress = 1.0
                        }
                }
                .padding()
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                .padding()
            }
        }
    }
}

struct ProgressDemo_Previews: PreviewProvider {
    static var previews: some View {
        ProgressDemo()
    }
}
