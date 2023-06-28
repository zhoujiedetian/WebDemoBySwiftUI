//
//  ColorDemo.swift
//  TestUI
//
//  Created by 精灵要跳舞 on 2023/6/26.
//

import SwiftUI

struct ColorDemo: View {
    
    @State var cardItems: [CardModel] = []
    @State var searchStr: String = ""
    @State var showSearchBar = false
    
    var body: some View {
        VStack {
//            CardTitleView
//            CardSearchBarView
            SwitchSearchBar
            if cardItems.isEmpty {
                Spacer()
                CardLoadingView()
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
    
    private var CardSearchBarView: some View {
        TextField("搜索颜色值", text: $searchStr)
            .padding(7)
            .padding(.horizontal, 25)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .overlay {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 8)
            }
            .padding(.horizontal, 10)
            .onChange(of: searchStr) { newValue in
                if searchStr != "" {
                    searchColor()
                }else {
                    getColors()
                }
            }
    }
    
    private var SearchButtonView: some View {
        Button {
            withAnimation {
                showSearchBar.toggle()
            }
        } label: {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.gray)
        }
    }
    
    private var CloseButtonView: some View {
        Button {
            withAnimation {
                searchStr = ""
                showSearchBar.toggle()
            }
        } label: {
            Text("取消")
                .foregroundColor(.gray)
        }

    }
    
    private var SwitchSearchBar: some View {
        HStack(spacing: 20) {
            if showSearchBar {
                CardSearchBarView
                CloseButtonView
            }else {
                CardTitleView
                Spacer()
                SearchButtonView
            }
        }
        .padding(.top, 20)
        .padding(.bottom, 10)
        .padding(.horizontal)
        .zIndex(1)
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
    
    func searchColor() {
        let query = searchStr.lowercased()
        DispatchQueue.global(qos: .background).async {
            let filter = cardItems.filter({$0.cardColorRBG.lowercased().contains(query)})
            DispatchQueue.main.async {
                withAnimation {
                    self.cardItems = filter
                }
            }
        }
    }
}

struct ColorDemo_Previews: PreviewProvider {
    static var previews: some View {
        TabberView()
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

struct TabberView: View {
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            ColorDemo()
                .tabItem {
                    if self.selectedTab == 0 {
                        Image(systemName: "house")
                    }else {
                        Image(systemName: "house.fill")
                    }
                    Text("首页")
                }
                .tag(0)
            Text("我的")
                .tabItem {
                    if self.selectedTab == 1 {
                        Image(systemName: "person")
                    }else {
                        Image(systemName: "person.fill")
                    }
                    Text("我的")
                }
                .tag(1)
        }
        .accentColor(Color.hex(0x409EFF))
    }
}
