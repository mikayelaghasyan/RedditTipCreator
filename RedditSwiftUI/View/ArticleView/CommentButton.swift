//
//  CommentButton.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/24/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import SwiftUI

struct CommentButton: View {
    var body: some View {
        Button(action: {
        }) {
            HStack {
                Image("comment")
                Text("0")
            }
        }.buttonStyle(SecondaryButtonStyle())
    }
}

struct CommentButton_Previews: PreviewProvider {
    static var previews: some View {
        CommentButton()
    }
}
