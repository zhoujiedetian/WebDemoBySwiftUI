//
//  LogoViewDemo.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/28.
//

import SwiftUI

struct LogoViewDemo: View {
    
    @State var logoImage: String = "applelogo"
    @State var logoColor: Color = Color(.black)
    @State var bgColor: Color = Color(.systemGray6)
    
    private var segmentTitle = ["背景色", "图标", "填充色"]
    @State var selectedSegment: Int = 0
    
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    @State var cardItems: [CardModel] = []
    
    private var appleSymbols = ["house.circle", "person.circle", "bag.circle", "location.circle", "bookmark.circle", "gift.circle", "globe.asia.australia.fill", "pencil.circle", "link.circle"]
    
    @State var showChooseImageSheet: Bool = false
    
    @State var showImagePicker: Bool = false
    @State var image: UIImage?
    
    private var ShowLogoView: some View {
        Image(systemName: logoImage)
            .font(.system(size: 68))
            .foregroundColor(logoColor)
            .frame(minWidth: 80, maxWidth: 120, minHeight: 80, maxHeight: 120)
            .background(bgColor)
            .cornerRadius(8)
            .onTapGesture {
                self.showChooseImageSheet.toggle()
            }
    }
    
    private var ShowImageView: some View {
        Image(uiImage: self.image!)
            .resizable()
            .scaledToFill()
            .frame(width: 68, height: 68, alignment: .center)
            .clipShape(Circle())
            .padding(20)
            .background(bgColor)
            .cornerRadius(8)
            .onTapGesture {
                self.showChooseImageSheet.toggle()
            }
    }
    
    private var SegmentView: some View {
        Picker("分段选择", selection: $selectedSegment) {
            ForEach(0..<3) {
                Text(self.segmentTitle[$0])
                    .tag($0)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
    
    private var BGColorView: some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                ForEach(cardItems, id:
                            \.cardColorRBG) { item in
                    Rectangle()
                        .fill(Color.hex(item.cardBGColor))
                        .frame(width: 80, height: 80)
                        .cornerRadius(8)
                        .onTapGesture {
                            bgColor = Color.hex(item.cardBGColor)
                        }
                }
            }
        }
        .padding()
    }
    
    private var SwitchIconView: some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                ForEach(appleSymbols, id: \.self) { symbol in
                    Image(systemName: symbol)
                        .font(.system(size: 30))
                        .frame(width: 80, height: 80)
                        .background(bgColor)
                        .cornerRadius(8)
                        .onTapGesture {
                            logoImage = symbol
                        }
                }
            }
        }
        .padding()
    }
    
    private var LogoColorView: some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                ForEach(cardItems, id:
                            \.cardColorRBG) { item in
                    Rectangle()
                        .fill(Color.hex(item.cardBGColor))
                        .frame(width: 80, height: 80)
                        .cornerRadius(8)
                        .onTapGesture {
                            logoColor = Color.hex(item.cardBGColor)
                        }
                }
            }
        }
        .padding()
    }
    
    private var chooseImageSheet: ActionSheet {
        let action = ActionSheet(title: Text("选择来源"), buttons: [.default(Text("相册"), action: {
            self.showImagePicker.toggle()
        }), .cancel(Text("取消"), action: {
            
        })])
        return action
    }
    
    var body: some View {
        VStack {
            Spacer()
            if image != nil {
                ShowImageView
            }else {
                ShowLogoView
            }
            Spacer()
            SegmentView
            if selectedSegment == 0 {
                BGColorView
            }else if selectedSegment == 1 {
                SwitchIconView
            }else {
                LogoColorView
            }
            
        }
        .onAppear {
            getColors()
        }
        .actionSheet(isPresented: $showChooseImageSheet, content: {chooseImageSheet})
        .sheet(isPresented: $showImagePicker) {
            ImagePickerView { image in
                self.image = image
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

struct LogoViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        LogoViewDemo()
    }
}
