//
//  DisclourseDemo.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/20.
//

import SwiftUI

struct DisclourseDemo: View {
    @State private var isShow: [Bool] = Array.init(repeating: false, count: 3)
    private let FAQ = [
        (
            question: "如何把大象装进冰箱？",
            answer: "第一，先把冰箱打开。第二，把大象装进去。第三，把冰箱门关上。"
        ),
        (
            question: "如何把企鹅装进冰箱？",
            answer: "第一，先把冰箱打开。第二，把大象拿出来。第三，把企鹅装进去。第四，把冰箱门关上。"
        ),
        (
            question: "动物森林要举行动物大会，有一只动物缺席了，是什么动物？",
            answer: "企鹅，因为他还在冰箱里。"
        )
    ]
    var body: some View {
        List {
            ForEach(FAQ.indices, id: \.self) { index in
                DisclosureGroup(isExpanded: $isShow[index]) {
                    Text(FAQ[index].answer)
                        .font(.body)
                        .fontWeight(.light)
                } label: {
                    Text(FAQ[index].question)
                }
                .padding()
            }
        }
        
    }
}

struct DisclourseDemo_Previews: PreviewProvider {
    static var previews: some View {
        DisclourseDemo()
    }
}
