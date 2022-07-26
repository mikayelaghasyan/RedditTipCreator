//
//  String+Url.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/23/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import Foundation

extension String {
    var url: URL? {
        URL(string: self)
    }
}
