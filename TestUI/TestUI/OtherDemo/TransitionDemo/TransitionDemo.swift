//
//  TransitionDemo.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/25.
//

import SwiftUI

struct TransitionTopBarView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(getCurrentDate())
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text("今天")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
            }
            
            Spacer()
            
            Image(uiImage: TransitionModel.sampleModels[0].image)
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(Color.gray, lineWidth: 1)
                }
        }
    }
    
    func getCurrentDate(_ format: String = "EEEE, MMM d") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: Date())
    }
}

struct SummaryView: View {
    let category: String
    let headline: String
    let subline: String
    @Binding var isShowContent: Bool
    var body: some View {
        VStack {
            Spacer()
            Rectangle()
                .frame(minHeight: 100, maxHeight: 150)
                .overlay {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(self.category.uppercased())
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.secondary)
                            
                            Text(self.headline.uppercased())
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                                .minimumScaleFactor(0.1)
                                .lineLimit(2)
                                .padding(.bottom, 5)
                            
                            if !self.isShowContent {
                                Text(self.subline)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .minimumScaleFactor(0.1)
                                    .lineLimit(3)
                            }
                        }
                        .padding()
                        Spacer()
                    }
                }
        }
        .foregroundColor(.white)
    }
}

struct TansitionCardView: View {
    let category: String
    let headline: String
    let subline: String
    let image: UIImage
    var content: String
    @Binding var isShowContent: Bool
    var body: some View {
        GeometryReader { gr in
            ZStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        Image(uiImage: self.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: gr.size.width, height: 500)
    //                        .padding(.horizontal, 15)
                            .border(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), width: self.isShowContent ? 0 : 1)
                            .cornerRadius(15)
                            .overlay {
                                SummaryView(category: self.category, headline: self.headline, subline: self.subline, isShowContent: self.$isShowContent)
                                    .cornerRadius(self.isShowContent ? 0 : 15)
                            }
                        
                        if self.isShowContent {
                            Text(self.content)
                                .foregroundColor(Color(.darkGray))
                                .font(.system(.body, design: .rounded))
                                .padding(.horizontal)
                                .padding(.bottom, 50)
                                .transition(.move(edge: .top))
                                .animation(.linear, value: 0)
                        }
                    }
                }
                .shadow(color: Color(extRed: 64, extGreen: 64, extBlue: 64, opacity: 0.3), radius: self.isShowContent ? 0 : 15)
                
                if self.isShowContent {
                    VStack {
                        HStack {
                            Spacer()
                            Button {
                                self.isShowContent = false
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .font(.system(size: 26))
                                    .foregroundColor(.white)
                                    .opacity(0.7)
                            }

                        }
                        Spacer()
                    }
                    .padding(.top, 50)
                    .padding(.trailing)
                }
            }
        }
    }
}

struct TransitionDemo: View {
    
    @State private var showContents: [Bool] = Array(repeating: false, count: TransitionModel.sampleModels.count)
    
    enum ContentMode {
        case list
        case content
    }
    
    private var contentMode: ContentMode {
        self.showContents.contains(true) ? .content : .list
    }
    
    var body: some View {
        GeometryReader { fullView in
            ScrollView {
                VStack {
                    TransitionTopBarView()
                        .padding(.horizontal, 20)
                        .opacity(self.contentMode == .content ? 0 : 1)
                    
                    
                    ForEach(TransitionModel.sampleModels.indices, id: \.self) { index in
                        GeometryReader { gr in
                            TansitionCardView(category: TransitionModel.sampleModels[index].category, headline: TransitionModel.sampleModels[index].headline, subline: TransitionModel.sampleModels[index].subHeadline, image: TransitionModel.sampleModels[index].image, content: TransitionModel.sampleModels[index].content, isShowContent: self.$showContents[index])
                                .offset(y: self.showContents[index] ? -gr.frame(in: .global).minY : 0)
                                .padding(.horizontal, self.showContents[index] ? 0 : 20)
                                .opacity(self.contentMode == .list || (self.contentMode == .content && self.showContents[index]) ? 1 : 0)
                                .onTapGesture {
                                    self.showContents[index] = true
                                }
                        }
                        .frame(height: self.showContents[index] ? fullView.safeAreaInsets.top + fullView.safeAreaInsets.bottom + fullView.size.height : 500)
                        
                    }
                }
            }
        }
    }
}

struct TransitionDemo_Previews: PreviewProvider {
    static var previews: some View {
        TransitionDemo()
    }
}
