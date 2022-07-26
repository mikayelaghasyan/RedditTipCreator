//
//  RedditCollection.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/18/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

struct RedditCollection: RedditObject, Decodable {
    enum CodingKeys: String, CodingKey {
        case children
    }

    var children: [RedditObject]

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        var childrenContainer = try container.nestedUnkeyedContainer(forKey: .children)
        var children: [RedditObject] = []
        while !childrenContainer.isAtEnd {
            let child = try RedditObjectDecoder().decode(from: childrenContainer.superDecoder())
            children.append(child)
        }
        self.children = children
    }
}
