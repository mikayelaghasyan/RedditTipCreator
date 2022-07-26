//
//  TipCreatorStepper.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/25/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import SwiftUI

struct TipCreatorStepper: View {
    var minValue: Int = 1
    var maxValue: Int = 100

    @Binding var value: Int

    var body: some View {
        HStack(spacing: 8) {
            Button(action: {
                if self.value > self.minValue {
                    self.value -= 1
                }
            }) {
                Text("–")
            }.buttonStyle(StepperButtonStyle())
                .frame(width: 78)

            Button(action: {
            }) {
                Text("$\(self.value)")
            }.buttonStyle(StepperButtonStyle())
                .frame(maxWidth: .infinity)

            Button(action: {
                if self.value < self.maxValue {
                    self.value += 1
                }
            }) {
                Text("+")
            }.buttonStyle(StepperButtonStyle())
                .frame(width: 78)
        }
    }
}

struct TipCreatorStepper_Previews: PreviewProvider {
    static var previews: some View {
        TipCreatorStepper(value: .constant(5))
    }
}
