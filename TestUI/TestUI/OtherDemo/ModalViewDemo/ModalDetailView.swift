//
//  ModalDetailView.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/13.
//

import SwiftUI

struct ModalDetailView: View {
//    @Environment(\.dismiss) var dismiss
    @Binding var isDismiss: Bool
    @State private var isShowAlert = false
    var body: some View {
        NavigationView {
            Button {
                self.isShowAlert.toggle()
            } label: {
                Text("打开警告弹窗")
            }
            .alert(isPresented: $isShowAlert, content: {
                Alert(title: Text("这是title"), message: Text("这是内容很多很多很多很多"), primaryButton: .default(Text("确定"), action: {
                    
                }), secondaryButton: .cancel(Text("取消"), action: {
                    
                }))
            })
            
            .navigationTitle("详情页")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //                            self.dismiss()
                        self.isDismiss.toggle()
                    } label: {
                        Image(systemName: "chevron.down.circle.fill")
                            .foregroundColor(.gray)
                    }
                    
                }
            }
        }
    }
}

struct ModalDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ModalDetailView(isDismiss: .constant(true))
    }
}
