//
//  SearchBarDemo.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/19.
//

import SwiftUI

struct SearchBarDemo: View {
    @State var text: String
    @State var isEditing: Bool = false
    @State var offset: CGFloat = .zero
    var body: some View {
        HStack(spacing:0) {
            TextField("搜你想看的", text: $text, onEditingChanged: { isEditing in
                print(self.text)
            })
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 8)
                        
                        Button {
                            self.text = ""
                        } label: {
                            Image(systemName: "multiply.circle.fill")
                                .foregroundColor(.gray)
                                .padding(.trailing, 8)
                        }

                    }
                    
                }
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
            
            if isEditing {
                Button {
                    self.isEditing = false
                    self.text = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                } label: {
                    Text("搜索")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default, value: offset)
            }
        }
    }
}

struct SearchBarDemo_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarDemo(text: "")
    }
}
