//
//  StepperViewDemo.swift
//  TestUI
//
//  Created by 精灵要跳舞 on 2023/6/13.
//

import SwiftUI

struct StepperViewDemo: View {
    @State private var amount = 1
    var body: some View {
        Stepper(label: {
            Text("\(amount)")
        }, onIncrement: {
            self.amount += 1
        }, onDecrement: {
            self.amount -= 1
        }, onEditingChanged: { change in
            print(change)
        })
        
    }
}

struct StepperViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        StepperViewDemo()
    }
}
