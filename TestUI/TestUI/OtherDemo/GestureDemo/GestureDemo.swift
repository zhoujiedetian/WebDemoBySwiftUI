//
//  GestureDemo.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/14.
//

import SwiftUI

struct GestureDemo: View {
    @State private var isCircleColorChanged = false
    @State private var isHeartColorChanged = false
    @State private var isHeartSizeChanged = false
    @GestureState private var longPressTap = false
    @GestureState private var dragOffSet = CGSize.zero
    @State private var position = CGSize.zero
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(isCircleColorChanged ? Color(.systemGray5) : .red)
            Image(systemName: "heart.fill")
                .foregroundColor(isHeartColorChanged ? .red : .white)
                .font(.system(size: 80))
                .scaleEffect(isHeartSizeChanged ? 1.0 : 0.5)
                .opacity(longPressTap ? 0.4 : 1.0)
        }
        .offset(x: position.width + dragOffSet.width, y: position.height + dragOffSet.height)
//        .onTapGesture {
//            isCircleColorChanged.toggle()
//            isHeartColorChanged.toggle()
//            isHeartSizeChanged.toggle()
//        }
        .gesture(
//            TapGesture()
//                .onEnded({
//                    isCircleColorChanged.toggle()
//                    isHeartColorChanged.toggle()
//                    isHeartSizeChanged.toggle()
//                })
//            LongPressGesture(minimumDuration: 1)
//                .updating($longPressTap, body: { currentState, state, transaction in
//                    state = currentState
//                })
//                .onEnded({ _ in
//                    isCircleColorChanged.toggle()
//                    isHeartColorChanged.toggle()
//                    isHeartSizeChanged.toggle()
//                })
//            DragGesture()
//                .updating($dragOffSet, body: { currentPosition, state, transaction in
//                    state = currentPosition.translation
//                })
//                .onEnded({ currentPostion in
//                    self.position.height += currentPostion.translation.height
//                    self.position.width += currentPostion.translation.width
//                })
            
            /*组合手势*/
            LongPressGesture(minimumDuration: 1)
                .updating($longPressTap, body: { currentState, state, transaction in
                    state = currentState
                    isCircleColorChanged.toggle()
                    isHeartColorChanged.toggle()
                    isHeartSizeChanged.toggle()
                })
                .sequenced(before: DragGesture())
                .updating($dragOffSet, body: { currentPosition, state, transaction in
                    switch currentPosition {
                        
                    case .first(true):
                        print("正在点击")
                    case .second(true, let drag):
                        state = drag?.translation ?? .zero
                    default:
                        break
                    }
                
                })
                .onEnded({ currentPostion in
                    guard case .second(true, let drag?) = currentPostion else {
                        return
                    }
                    self.position.height += drag.translation.height
                    self.position.width += drag.translation.width
                    isCircleColorChanged.toggle()
                    isHeartColorChanged.toggle()
                    isHeartSizeChanged.toggle()
                })
        )
    }
}

struct GestureDemo_Previews: PreviewProvider {
    static var previews: some View {
        GestureDemo()
    }
}
