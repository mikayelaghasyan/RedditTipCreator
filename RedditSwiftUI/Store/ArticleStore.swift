//
//  ArticleStore.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/16/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import Foundation
import Combine

class ArticleStore: ObservableObject {
    let popularArticlesPath = "/r/popular"

    var apiClient: RedditApiClient

    var cancellable: AnyCancellable?

    @Published var articleList: [Article] = []
    @Published var isLoaded: Bool = false

    init(apiClient: RedditApiClient) {
        self.apiClient = apiClient
    }

    func loadPopularArticles() {
        let publisher = self.apiClient.loadDataPublisher(path: self.popularArticlesPath, dataType: RedditCollection.self)
        cancellable = publisher.replaceError(with: nil)
            .sink { [weak self] result in
                if let result = result {
                    self?.articleList = result.children as? [Article] ?? []
                } else {
                    self?.articleList = []
                }
                self?.isLoaded = true
                self?.cancellable = nil
        }
    }
}
