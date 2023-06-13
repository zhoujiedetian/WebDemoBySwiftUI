//
//  ModalViewDemo.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/13.
//

import SwiftUI

struct ModalViewDemo: View {
    @State private var isPresented: Bool = false
    var body: some View {
        Button {
            self.isPresented.toggle()
        } label: {
            Text("打开模态弹窗")
                .font(.system(size: 17))
                .foregroundColor(.white)
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color.gray)
                .cornerRadius(8)
                .padding(.horizontal, 20)
        }
        .sheet(isPresented: $isPresented) {
            ModalDetailView(isDismiss: $isPresented)
        }
    }
}

struct ModalViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        ModalViewDemo()
    }
}
