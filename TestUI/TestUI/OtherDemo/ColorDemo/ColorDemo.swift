//
//  ColorDemo.swift
//  TestUI
//
//  Created by 精灵要跳舞 on 2023/6/26.
//

import SwiftUI

struct ColorDemo: View {
    
    @State var cardItems: [CardModel] = []
    
    var body: some View {
        VStack {
            CardTitleView
            if cardItems.isEmpty {
                Spacer()
                ProgressView()
                Spacer()
            }else {
                CardListView
            }
            
        }
        .onAppear(perform: {
            print(123)
            getColors()
        })
    }
    
    private var CardTitleView: some View {
        Text("世界上最高级的颜色")
            .font(.system(size: 17))
            .fontWeight(.bold)
    }
    
    private var CardListView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(cardItems, id: \.cardColorRBG) { item in
                VStack(spacing: 10) {
                    ColorCard(color: Color.hex(item.cardBGColor), title: item.cardColorName, colorHex: item.cardColorRBG)
                }
            }
            
        }
    }
    
    func getColors() {
        let jsonURL = "https://api.npoint.io/dc5a1718e0e958613ade"
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: jsonURL)!) { data, _, _ in
            guard let jsonData = data else { return }
            do {
                let colors = try JSONDecoder().decode([CardModel].self, from: jsonData)
                self.cardItems = colors
            }catch {
                print(error)
            }
        }
        .resume()
    }
}

struct ColorDemo_Previews: PreviewProvider {
    static var previews: some View {
        ColorDemo()
    }
}

extension Color {
    static func rgb(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> Color {
        return Color(red: red/255.0, green: green/255.0, blue: blue/255.0)
    }
    
    static func hex(_ hex: UInt) -> Color {
        let r: CGFloat = CGFloat((hex & 0xFF0000) >> 16)
        let g: CGFloat = CGFloat((hex & 0x00FF00) >> 8)
        let b: CGFloat = CGFloat(hex & 0x0000FF)
        return rgb(r, g, b)
    }
}

struct ColorCard: View {
    var color: Color
    var title: String
    var colorHex: String
    var body: some View {
        ZStack {
            Rectangle()
                .fill(color)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 110)
                .cornerRadius(8)
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text(title)
                        .font(.system(size: 17))
                        .bold()
                        .foregroundColor(.white)
                    
                    Text(colorHex)
                        .font(.system(size: 14))
                        .bold()
                        .foregroundColor(.white)
                }
                Spacer()
            }
            .padding()
        }
        .padding(.horizontal)
        .contextMenu {
            Button {
                UIPasteboard.general.string = colorHex
            } label: {
                Text("复制颜色值")
                    .padding()
            }

        }
    }
}
