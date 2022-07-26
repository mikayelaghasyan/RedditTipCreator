//
//  TipButton.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/24/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import SwiftUI

struct TipButton: View {
    @EnvironmentObject var dynamicOverlayContext: DynamicOverlayContext
    @EnvironmentObject var userStore: UserStore

    let article: Article
    var articleAuthorBinding: Binding<User?> {
        var user = self.userStore.userMap[self.article.authorUsername]
        return Binding(get: {
            return user
        }, set: {
            user = $0
        })
    }

    @State var tippedAmount: Int?

    var body: some View {
        ZStack {
            Button(action: {
                if let user = self.articleAuthorBinding.wrappedValue {
                    self.dynamicOverlayContext.presentOverlay(overlay: DynamicSheet(view: { isPresented in
                        TipCreatorView(isPresented: isPresented, user: user, tippedAmount: self.$tippedAmount)
                    }))
                }
            }) {
                HStack {
                    Image("tip")
                    Text("Tip")
                }
            }.buttonStyle(SecondaryButtonStyle())
                .disabled(self.articleAuthorBinding.wrappedValue == nil)
                .onAppear {
                    self.userStore.loadUser(username: self.article.authorUsername)
            }
            if self.tippedAmount != nil {
                TipReactionView(tippedAmount: self.$tippedAmount)
            }
        }.frame(width: 75)
    }
}

struct TipButton_Previews: PreviewProvider {
    static var previews: some View {
        TipButton(article: Fixtures.article)
    }
}
