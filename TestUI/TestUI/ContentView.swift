//
//  ContentView.swift
//  TestUI
//
//  Created by zhoujie on 2023/5/30.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    var body: some View {
        VStack {
            Text("Hello world Hello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello world")
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.blue)
                .shadow(color: .black, radius: 10)
                .background(.yellow)
                .padding(.horizontal, 20)
                .lineSpacing(10)
//                .lineLimit(1)
                .multilineTextAlignment(.center)
                .truncationMode(.head)
                .blur(radius: 1)
//                .rotationEffect(.degrees(20), anchor: UnitPoint(x: 0.5, y: 0.5))
                .rotation3DEffect(.degrees(60), axis: (x: 0, y: 0, z: 1))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
