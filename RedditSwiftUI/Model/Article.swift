//
//  Article.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/16/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

struct Article: Identifiable {
    let id: String
    let title: String
    let subreddit: String
    let imageUrls: [String]?
    let authorUsername: String
    var author: User? = nil
}
