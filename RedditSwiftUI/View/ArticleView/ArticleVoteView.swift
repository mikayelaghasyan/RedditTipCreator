//
//  ArticleVoteView.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/24/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import SwiftUI

struct ArticleVoteView: View {
    var body: some View {
        HStack {
            Button(action: {
            }) {
                Image("upvote")
            }.buttonStyle(SecondaryButtonStyle())
            Text("Vote")
            Button(action: {
            }) {
                Image("downvote")
            }.buttonStyle(SecondaryButtonStyle())
        }.textStyle(ContentStyle())
    }
}

struct ArticleVoteView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleVoteView()
    }
}
