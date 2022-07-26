//
//  Fixtures.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/23/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

struct Fixtures {
    static let article = Article(id: "1", title: "First article", subreddit: "r/subreddit", imageUrls: nil, authorUsername: "u/username")
    static let user = User(id: "1", name: "username", imageUrl: nil)
    static let creditCard = CreditCard(cardType: .visa, lastFourDigits: "0741")
}
