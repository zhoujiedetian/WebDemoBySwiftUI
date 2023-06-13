//
//  WBPostImageCell.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/1.
//

import SwiftUI
private let kImageSapce : CGFloat = 6
struct WBPostImageCell: View {
    let images: [String]
    let width: CGFloat
    var body: some View {
        Group {
            if images.count == 1 {
                loadImage(images[0])
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: (width) * 0.75)
                    .clipped()
            }else if images.count == 2 {
                WBPostImageCellRow(images: images, width: width)
            }else if images.count == 3 {
                WBPostImageCellRow(images: images, width: width)
            }else if images.count == 4 {
                VStack(spacing: kImageSapce) {
                    WBPostImageCellRow(images: Array(images[0...1]), width: width)
                    WBPostImageCellRow(images: Array(images[2...3]), width: width)
                }
            }else if images.count == 5 {
                VStack(spacing: kImageSapce) {
                    WBPostImageCellRow(images: Array(images[0...1]), width: width)
                    WBPostImageCellRow(images: Array(images[2...4]), width: width)
                }
            }else if images.count == 6 {
                VStack(spacing: kImageSapce) {
                    WBPostImageCellRow(images: Array(images[0...2]), width: width)
                    WBPostImageCellRow(images: Array(images[3...5]), width: width)
                }
            }
        }
    }
}

struct WBPostImageCellRow: View {
    let images: [String]
    let width: CGFloat
    var body: some View {
        HStack {
            ForEach(images, id: \.self) { image in
                let imageWid = (self.width - kImageSapce * CGFloat(self.images.count - 1)) / CGFloat(self.images.count)
                loadImage(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageWid, height: imageWid)
                    .clipped()
            }
        }
    }
}

struct WBPostImageCell_Previews: PreviewProvider {
    static var previews: some View {
        let userData = WBUserData()
        let images = userData.recommandPostList.list[0].images
        let width = UIScreen.main.bounds.width
        return Group {
            WBPostImageCell(images: Array(images[0...0]), width: width).environmentObject(userData)
        }
        .previewLayout(.fixed(width: width, height: 300))
    }
}
