//
//  SwipeCardDemo.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/14.
//

import SwiftUI

enum DragState {
    case inactive
    case pressing
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive, .pressing:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .inactive:
            return false
        case .pressing, .dragging:
            return true
        }
    }
}

struct SwipeCardDemo: View {
    
    let data = SwipeData.loadData()
    
    // 数据源
    @State var items: [SwipeData] = {
        let arr = SwipeData.loadData()
        var result : [SwipeData] = []
        for i in 0..<2 {
            let item = SwipeData(name: arr[i].name, image: arr[i].image)
            result.append(item)
        }
        return result
    }()
    
    // 拖动手势状态
    @GestureState private var dragState = DragState.inactive
    
    @State private var offset : CGFloat = .zero
    
    // 判定喜欢或不喜欢的X轴移动距离
    private let dragPosition = 80.0
    
    // 数据源最后一张图片的索引
    @State private var lastIndex = 1
    
    // 移除的转场动画
    @State private var removalTransition = AnyTransition.trailBottom
    
    var body: some View {
        VStack {
            TopBarMenu()
            ZStack {
                ForEach(items) { data in
                    SwipeCardView(data: data)
                        .zIndex(self.isTop(data) ? 1 : 0)
                        .overlay(content: {
                            ZStack {
                                Image(systemName: "hand.thumbsdown.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 100))
                                    .opacity((self.isTop(data)&&self.dragState.translation.width < -self.dragPosition) ? 1:0)
                                Image(systemName: "hand.thumbsup.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 100))
                                    .opacity((self.isTop(data)&&self.dragState.translation.width > self.dragPosition) ? 1:0)
                            }
                        })
                        .offset(x: self.isTop(data) ? self.dragState.translation.width:0, y: self.isTop(data) ? self.dragState.translation.height:0)
                        .scaleEffect(self.dragState.isDragging&&self.isTop(data) ? 0.95 : 1)
                        .rotationEffect(Angle(degrees: self.isTop(data) ? Double(self.dragState.translation.width / 10.0):0))
                        .animation(.interpolatingSpring(stiffness: 180, damping: 100), value: offset)
                        .transition(self.removalTransition)
                        .gesture(
                            LongPressGesture(minimumDuration: 0.1)
                                .sequenced(before: DragGesture())
                                .updating(self.$dragState, body: { value, state, transcation in
                                    switch value {
                                    case .first(true):
                                        state = .pressing
                                    case .second(true, let drag):
                                        state = .dragging(translation: drag?.translation ?? .zero)
                                    default:
                                        break
                                    }
                                })
                                .onChanged({ value in
                                    guard case .second(true, let drag?) = value else { return  }
                                    if drag.translation.width < -self.dragPosition {
                                        self.removalTransition = .leadingBottom
                                    }
                                    if drag.translation.width > self.dragPosition {
                                        self.removalTransition = .leadingBottom
                                    }
                                })
                                .onEnded({ value in
                                    guard case .second(true, let drag?) = value else { return  }
                                    if drag.translation.width < -self.dragPosition || drag.translation.width > self.dragPosition {
                                        self.removeCard()
                                    }
                                })
                        )
                        
                }
            }
            Spacer(minLength: 20)
            BottomBarView()
                .opacity(dragState.isDragging ? 0 : 1)
                .animation(.default, value: offset)
        }
    }
    
    func isTop(_ data: SwipeData) -> Bool {
        guard let index = items.firstIndex(where: { $0.id == data.id
        })  else { return false }
        return index == 0
    }
    
    func removeCard() {
        items.removeFirst()
        self.lastIndex += 1
        self.lastIndex %= self.data.count
        let item = SwipeData(name: data[self.lastIndex].name, image: data[self.lastIndex].image)
        items.append(item)
    }
}

struct SwipeCardDemo_Previews: PreviewProvider {
    static var previews: some View {
        SwipeCardDemo()
    }
}

extension AnyTransition {
    static var trailBottom: AnyTransition {
        AnyTransition.asymmetric(insertion: .identity, removal: AnyTransition.move(edge: .trailing).combined(with: .move(edge: .bottom)))
    }
    
    static var leadingBottom: AnyTransition {
        AnyTransition.asymmetric(insertion: .identity, removal: AnyTransition.move(edge: .leading).combined(with: .move(edge: .bottom)))
    }
}
