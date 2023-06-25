//
//  BannerDemo.swift
//  TestUI
//
//  Created by 精灵要跳舞 on 2023/6/19.
//

import SwiftUI

struct BannerDemo: View {
    @State private var index = 2
    @GestureState var dragOffset: CGFloat = 0
    @State private var items = SwipeData.loadData()
    @State private var offset: CGFloat = .zero
    
    @State private var isShowDetail = true
    var body: some View {
        ZStack {
            GeometryReader { gr in
                HStack(spacing: 0) {
                    ForEach(items.indices, id: \.self) { index in
                        GeometryReader { innerGr in
                            BannerCardView(item: items[index], index: index)
                                .offset(y: self.isShowDetail ? -innerGr.size.height * 0.3 : 0)
                                .onTapGesture {
                                    self.isShowDetail.toggle()
                                }
                        }
                        .padding(.horizontal, self.isShowDetail ? 0 : 20)
                        .opacity(self.index == index ? 1.0 : 0.7)
                        .frame(width: gr.size.width, height: self.index == index ? (self.isShowDetail ? gr.size.height : 250) : 200)
                    }
                }
                .frame(width: gr.size.width, height: gr.size.height, alignment: .leading)
                .offset(x: -CGFloat(self.index) * gr.size.width)
                .offset(x: self.dragOffset)
                .gesture(
                    !self.isShowDetail ?
                    DragGesture()
                        .updating(self.$dragOffset, body: { value, state, transaction in
                            state = value.translation.width
                        })
                        .onEnded({ value in
                            let threshold = gr.size.width * 0.65
                            var newIndex = Int(-value.translation.width/threshold)+self.index
                            newIndex = min(max(0, newIndex), SwipeData.loadData().count - 1)
                            self.index = newIndex
                            print(self.index)
                        })
                    : nil
                )
            }
            .animation(.interpolatingSpring(mass: 0.6, stiffness: 100, damping: 10), value: offset)
            if self.isShowDetail {
                BannerDetailDemo(imageName: items[self.index].image)
                    .offset(y: 200)
                    .transition(.move(edge: .bottom))
                    .animation(.interpolatingSpring(mass: 0.5, stiffness: 100, damping: 10), value: offset)
            }
        }
        
    }
}

struct BannerDemo_Previews: PreviewProvider {
    static var previews: some View {
        BannerDemo()
    }
}

struct BannerCardView: View {
    let item: SwipeData
    let index: Int
    var body: some View {
        Image(uiImage: UIImage(named: item.image)!)
            .resizable()
            .scaledToFill()
            .cornerRadius(15)
//            .frame(width: gr.size.width, height: self.index == index ? 250 : 200)
            .clipped()
            .overlay {
                Text(item.name)
                    .bold()
                    .padding(10)
                    .background(.white)
                    .cornerRadius(8)
                    .padding(.leading, 15)
                    .padding(.bottom, 15) .padding([.bottom, .leading])
                    .frame(minWidth: 0, maxWidth: .infinity,minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
            }
    }
}
