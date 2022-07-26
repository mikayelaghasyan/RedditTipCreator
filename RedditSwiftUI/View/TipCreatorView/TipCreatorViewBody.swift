//
//  TipCreatorViewBody.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/25/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import SwiftUI

struct TipCreatorViewBody: View {
    let user: User
    @Binding var tipAmount: Int

    @State var cardsExpanded: Bool = false

    var profileImageUrlBinding: Binding<URL?> {
        var url = self.user.imageUrl?.url
        return Binding(get: {
            return url
        }, set: {
            url = $0
        })
    }

    var body: some View {
        VStack(spacing: 0) {
            Divider()
                .foregroundColor(Color.lightGray)
                .padding(.horizontal, 8)

            HStack(spacing: 0) {
                RemoteImage(imageUrl: self.profileImageUrlBinding)
                    .cornerRadius(4)
                    .frame(width: 64, height: 64)
                    .padding(16)
                Text(self.user.name)
                    .textStyle(TitleStyle())
                Spacer()
            }

            TipCreatorStepper(value: self.$tipAmount).padding(.horizontal, 16)

            HStack(spacing: 0) {
                Text("By tipping, you agree to our ")
                    .textStyle(BodyStyle())
                Button(action: {
                }) {
                    Text("Beta Terms of Service")
                }.buttonStyle(LinkButtonStyle())
            }.padding(.vertical, 10)

            Group {
                if self.cardsExpanded {
                    ExpandedCreditCardsView(onTap: {
                        withAnimation {
                            self.cardsExpanded = false
                        }
                    })
                } else {
                    Divider()
                        .foregroundColor(Color.lightGray)
                        .padding(.horizontal, 8)
                    CollapsedCreditCardsView(onTap: {
                        withAnimation {
                            self.cardsExpanded = true
                        }
                    })
                }
            }.padding(.horizontal, 16)
        }
    }
}

struct TipCreatorViewBody_Previews: PreviewProvider {
    static var previews: some View {
        TipCreatorViewBody(user: Fixtures.user, tipAmount: .constant(5))
    }
}
