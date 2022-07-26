//
//  RedditResponse.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/18/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import Foundation

struct RedditResponse: Decodable {
    let rootObject: RedditObject

    init(from decoder: Decoder) throws {
        self.rootObject = try RedditObjectDecoder().decode(from: decoder)
    }
}
