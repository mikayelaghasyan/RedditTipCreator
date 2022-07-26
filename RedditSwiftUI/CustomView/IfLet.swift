//
//  IfLet.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/20/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import SwiftUI

struct IfLet<T, Out: View>: View {
    let value: T?
    let produce: (T) -> Out

    init(_ value: T?, produce: @escaping (T) -> Out) {
        self.value = value
        self.produce = produce
    }

    var body: some View {
        Group {
            if value != nil {
                produce(value!)
            }
        }
    }
}
