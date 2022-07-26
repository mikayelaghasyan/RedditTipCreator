//
//  User.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/20/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

struct User: Identifiable {
    let id: String
    let name: String
    let imageUrl: String?
    var tips: Int? = nil

    mutating func tip(amount: Int) {
        self.tips = (self.tips ?? 0) + amount
    }
}
