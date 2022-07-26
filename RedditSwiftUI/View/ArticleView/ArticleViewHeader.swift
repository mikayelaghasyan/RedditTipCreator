//
//  ArticleViewHeader.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/20/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import SwiftUI

struct ArticleViewHeader: View {
    @EnvironmentObject var userStore: UserStore

    let article: Article
    var profileImageUrlBinding: Binding<URL?> {
        var url = self.userStore.userMap[self.article.authorUsername]?.imageUrl?.url
        return Binding(get: {
            return url
        }, set: {
            url = $0
        })
    }
    var tipsBinding: Binding<Int?> {
        var tips = self.userStore.userMap[self.article.authorUsername]?.tips
        return Binding(get: {
            return tips
        }, set: {
            tips = $0
        })
    }

    var body: some View {
        HStack {
            ProfileImageView(imageUrl: self.profileImageUrlBinding)
            VStack(alignment: .leading, spacing: 0) {
                Text(self.article.subreddit)
                    .textStyle(ContentStyle())
                HStack {
                    Text(self.article.authorUsername)
                        .textStyle(ContentStyle())
                    if self.tipsBinding.wrappedValue != nil {
                        Image("dollarGreen")
                        Text(String(format: "%.02f", Double(self.tipsBinding.wrappedValue!)))
                            .semiBoldFont(size: 12)
                            .foregroundColor(Color.primary)
                    }
                }
            }
        }.onAppear {
            self.userStore.loadUser(username: self.article.authorUsername)
        }
    }
}

struct ArticleViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        ArticleViewHeader(article: Fixtures.article)
    }
}
