//
//  ImagePickerView.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/28.
//

import SwiftUI
import Photos
import PhotosUI

 public struct ImagePickerView: UIViewControllerRepresentable {
     
     @Environment(\.dismiss) private var dismiss
     
    let onImagePicked: (UIImage) -> Void
     
     public func makeUIViewController(context: Context) -> some UIViewController {
         var config = PHPickerConfiguration()
         config.selectionLimit = 1
         config.filter = .images
         
         let picker = PHPickerViewController.init(configuration: config)
         picker.delegate = context.coordinator
         return picker
     }
     
     public func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
         
     }
     
     public func makeCoordinator() -> Coordinator {
         Coordinator(onDismiss: {
             dismiss()
         }, onImagePicked: { image in
             self.onImagePicked(image)
         })
     }
}

final public class Coordinator: NSObject, PHPickerViewControllerDelegate {
    
    private let onDismiss: ()->()
    private let onImagePicked: (UIImage)->()
    
    init(onDismiss: @escaping () -> Void, onImagePicked: @escaping (UIImage) -> Void) {
        self.onDismiss = onDismiss
        self.onImagePicked = onImagePicked
    }
    
    public func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        for result in results {
            result.itemProvider.loadObject(ofClass: UIImage.self) { obj, error in
                if let image = obj as? UIImage {
                    DispatchQueue.main.async {
                        print(image)
                        self.onImagePicked(image)
                    }
                }
            }
        }
        onDismiss()
    }
}

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView(onImagePicked: { image in
            
        })
    }
}
