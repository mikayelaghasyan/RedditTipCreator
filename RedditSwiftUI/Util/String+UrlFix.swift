//
//  String+UrlFix.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/23/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import Foundation

extension String {
    func fixUrl() -> String {
        return self.replacingOccurrences(of: "&amp;", with: "&")
    }
}
