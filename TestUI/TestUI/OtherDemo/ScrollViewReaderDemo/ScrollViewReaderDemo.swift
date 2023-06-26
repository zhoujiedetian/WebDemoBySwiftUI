//
//  ScrollViewReaderDemo.swift
//  TestUI
//
//  Created by 精灵要跳舞 on 2023/6/26.
//

import SwiftUI

struct ScrollViewReaderDemo: View {
    
    
    @State private var photos = ScrollViewReaderModel.sampleModels
    
    @State private var selectedModels = [ScrollViewReaderModel]()
    
    @State private var selectedId: UUID?
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(photos) { item in
//                        Image(item.imageName)
                        Image(uiImage: UIImage(named: item.imageName)!)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 180)
                            .cornerRadius(8)
                            .onTapGesture {
                                selectedModels.append(item)
                                selectedId = item.id
                                if let index = photos.firstIndex(where: {
                                    $0.id == item.id
                                }) {
                                    photos.remove(at: index)
                                }
                            }
                    }
                }
            }
            .padding()
            
            ScrollViewReader { scrollProxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: [GridItem()]) {
                        ForEach(selectedModels) { item in
                            Image(uiImage: UIImage(named: item.imageName)!)
                                .resizable()
                                .scaledToFill()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: 150)
                                .id(item.id)
                                .cornerRadius(8)
                                .onTapGesture {
                                    photos.append(item)
                                    if let index = selectedModels.firstIndex(where: {
                                        $0.id == item.id
                                    }) {
                                        selectedModels.remove(at: index)
                                    }
                                }
                        }
                    }
                }
                .frame(height: 100)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding()
                .onChange(of: selectedId) { newValue in
                    guard let newValue = newValue else { return }
                    scrollProxy.scrollTo(newValue)
                }
            }
        }
        .background(Color(.systemGray))
        
    }
}

struct ScrollViewReaderDemo_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderDemo()
    }
}
