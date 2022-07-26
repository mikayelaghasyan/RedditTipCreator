//
//  TipCreatorViewHeader.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/25/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import SwiftUI

struct TipCreatorViewHeader: View {
    let onClose: () -> Void

    var body: some View {
        HStack {
            Text("TIP CREATOR")
                .textStyle(HeaderStyle())
            Spacer()
            Button(action: {
                self.onClose()
            }) {
                Image("close")
            }.buttonStyle(SecondaryButtonStyle())
        }
            .frame(height: 42)
            .padding(.horizontal, 16)

    }
}

struct TipCreatorViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        TipCreatorViewHeader(onClose: {})
    }
}
