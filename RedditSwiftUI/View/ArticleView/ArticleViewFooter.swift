//
//  ArticleViewFooter.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/23/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import SwiftUI

struct ArticleViewFooter: View {
    let article: Article

    var body: some View {
        HStack {
            ArticleVoteView()
            Spacer()
            CommentButton()
            Spacer()
            TipButton(article: self.article)
        }.frame(height: 48)
    }
}

struct ArticleViewFooter_Previews: PreviewProvider {
    static var previews: some View {
        ArticleViewFooter(article: Fixtures.article)
        
    }
}
