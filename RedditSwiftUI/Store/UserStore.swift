//
//  UserStore.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/20/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import Foundation
import Combine

class UserStore: ObservableObject {
    var apiClient: RedditApiClient

    @Published var userMap: [String: User] = [:]

    init(apiClient: RedditApiClient) {
        self.apiClient = apiClient
    }

    func loadUser(username: String) {
        guard !self.userMap.keys.contains(username) else { return }
        let publisher = self.apiClient.loadDataPublisher(path: "/user/\(username)/about", dataType: User.self)
        _ = publisher
            .replaceError(with: nil)
            .sink { [weak self] result in
                if let user = result {
                    self?.userMap[username] = user
                }
            }
    }

    func tipUser(username: String, amount: Int) {
        self.userMap[username]?.tip(amount: amount)
    }
}
