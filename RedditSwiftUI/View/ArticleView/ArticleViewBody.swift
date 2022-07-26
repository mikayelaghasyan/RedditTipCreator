//
//  ArticleViewBody.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/23/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import SwiftUI

struct ArticleViewBody: View {
    @Environment(\.displayScale) var displayScale

    let article: Article

    var body: some View {
        VStack(alignment: .leading) {
            Text(self.article.title)
                .textStyle(TitleStyle())
            if self.hasImage {
                VStack(alignment: .center) {
                    RemoteImage(imageUrl: self.articleImageUrlBinding)
                }
            }
        }
    }

    fileprivate var hasImage: Bool {
        return self.article.imageUrls?.first != nil
    }

    fileprivate var articleImageUrlBinding: Binding<URL?> {
        var url = self.article.imageUrls?.first?.url
        return Binding(get: {
            return url
        }, set: {
            url = $0
        })
    }
}

struct ArticleViewBody_Previews: PreviewProvider {
    static var previews: some View {
        ArticleViewBody(article: Fixtures.article)
    }
}
