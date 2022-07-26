//
//  ArticleView.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/16/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import SwiftUI

struct ArticleView: View {
    let article: Article
    
    var body: some View {
        VStack(alignment: .leading) {
            ArticleViewHeader(article: self.article)
            ArticleViewBody(article: self.article)
            ArticleViewFooter(article: self.article)
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Fixtures.article)
    }
}
