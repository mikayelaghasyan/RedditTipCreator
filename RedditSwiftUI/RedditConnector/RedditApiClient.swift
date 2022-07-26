//
//  RedditApiClient.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/17/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import Foundation
import Combine

class RedditApiClient {
    var baseUrl: String
    var userAgent: String

    init(baseUrl: String, userAgent: String) {
        self.baseUrl = baseUrl
        self.userAgent = userAgent
    }

    func loadDataPublisher<T: RedditObject>(path: String, dataType: T.Type) -> AnyPublisher<T?, Error> {
        guard let url = URL(string: "\(self.baseUrl)\(path)") else { fatalError() }
        var request = URLRequest(url: url)
        request.addValue(self.userAgent, forHTTPHeaderField: "User-Agent")

        return URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: RedditResponse.self, decoder: JSONDecoder())
            .map { $0.rootObject as? T }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
