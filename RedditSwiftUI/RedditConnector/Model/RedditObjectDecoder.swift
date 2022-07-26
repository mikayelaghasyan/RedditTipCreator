//
//  RedditObjectDecoder.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/22/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

class RedditObjectDecoder {
    enum RedditObjectCodingKeys: String, CodingKey {
        case kind
        case data
    }

    func decode(from decoder: Decoder) throws -> RedditObject {
        let container = try decoder.container(keyedBy: RedditObjectCodingKeys.self)
        return try self.decodeObject(from: container)
    }

    fileprivate func decodeObject(from container: KeyedDecodingContainer<RedditObjectCodingKeys>) throws -> RedditObject {
        let kind = try container.decode(String.self, forKey: .kind)
        switch kind {
        case "Listing":
            return try container.decode(RedditCollection.self, forKey: .data)
        case "t2":
            return try container.decode(User.self, forKey: .data)
        case "t3":
            return try container.decode(Article.self, forKey: .data)
        default:
            fatalError()
        }
    }
}
