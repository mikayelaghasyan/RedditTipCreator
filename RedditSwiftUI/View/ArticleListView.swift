//
//  ArticleListView.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/16/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import SwiftUI

struct ArticleListView: View {
    @EnvironmentObject var articleStore: ArticleStore

    var body: some View {
        ZStack {
            if self.articleStore.isLoaded {
                NavigationView {
                    List {
                        ForEach(self.articleStore.articleList) { article in
                            ArticleView(article: article)
                        }
                    }.navigationBarTitle("Popular")
                }
            } else {
                LoadingView()
            }
        }
        .onAppear {
            self.articleStore.loadPopularArticles()
        }
    }
}

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView()
    }
}
