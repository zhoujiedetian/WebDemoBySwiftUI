//
//  CardLoadingView.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/28.
//

import SwiftUI

struct CardLoadingView: View {
    @State var show: Bool = false
    var body: some View {
        Image(systemName: "sun.min.fill")
            .resizable()
            .foregroundColor(Color.hex(0xFAD0C4))
            .aspectRatio(contentMode: .fit)
            .frame(width: 60, height: 60)
            .rotationEffect(.degrees(show ? 360 : 0))
            .onAppear {
                doAnimation()
            }
    }
    
    func doAnimation() {
        withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
            show.toggle()
        }
    }
}

struct CardLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        CardLoadingView()
    }
}
