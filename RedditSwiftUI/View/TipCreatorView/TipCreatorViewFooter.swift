//
//  TipCreatorViewFooter.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/25/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import SwiftUI

struct TipCreatorViewFooter: View {
    let user: User

    let onSubmit: () -> Void

    var body: some View {
        Button(action: {
            self.onSubmit()
        }) {
            Text("TIP \(self.user.name)")
        }
            .padding(4)
            .buttonStyle(PrimaryButtonStyle())
    }
}

struct TipCreatorViewFooter_Previews: PreviewProvider {
    static var previews: some View {
        TipCreatorViewFooter(user: Fixtures.user, onSubmit: {})
    }
}
