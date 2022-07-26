//
//  RedditUser.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/20/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

extension User: RedditObject, Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageUrl = "icon_img"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.imageUrl = try container.decode(String.self, forKey: .imageUrl).fixUrl()
    }
}
