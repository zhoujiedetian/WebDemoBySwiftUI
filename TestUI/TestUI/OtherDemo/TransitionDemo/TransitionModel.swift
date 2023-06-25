//
//  TransitionModel.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/25.
//

import SwiftUI

struct TransitionModel: Identifiable {
    var id = UUID()
    var category: String
    var headline: String
    var subHeadline: String
    var content: String
    var image: UIImage
    
    static let sampleModels = [
        TransitionModel(category: "推荐", headline: "编辑精选", subHeadline: "本周推荐语录", content: "要想在一个生活圈中生活下去，或者融入职场的氛围，首先你要学习这个圈子的文化和发展史，并尝试用这个圈子里面的话术和它们交流，这样才能顺利的融入这个圈子。", image: UIImage(named: "8697cf1ely8gashxj3b09j20u00u040v.jpg")!),
        TransitionModel(category: "热榜", headline: "每日热榜", subHeadline: "今日热门事件推送", content: "要想在一个生活圈中生活下去，或者融入职场的氛围，首先你要学习这个圈子的文化和发展史，并尝试用这个圈子里面的话术和它们交流，这样才能顺利的融入这个圈子。", image: UIImage(named: "d0c21786ly1gavj2c0kcej20c8096dh7.jpg")!),
        TransitionModel(category: "头条", headline: "精选头条", subHeadline: "你关注的才是头条", content: "要想在一个生活圈中生活下去，或者融入职场的氛围，首先你要学习这个圈子的文化和发展史，并尝试用这个圈子里面的话术和它们交流，这样才能顺利的融入这个圈子。", image: UIImage(named: "d0c21786ly1gavj2c0kcej20c8096dh7.jpg")!)
    ]
}
