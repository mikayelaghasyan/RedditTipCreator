//
//  TipCreatorView.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/24/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import SwiftUI

struct TipCreatorView: DynamicSheetPresentable {
    @EnvironmentObject var userStore: UserStore

    var isPresented: Binding<Bool>

    let user: User

    @Binding var tippedAmount: Int?

    @State var isFormPresented: Bool = true
    @State var isCoinAnimationPresented: Bool = false
    @State var tipAmount: Int = 5

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                TipCreatorViewHeader(onClose: {
                    self.isPresented.wrappedValue = false
                })

                TipCreatorViewBody(user: self.user, tipAmount: self.$tipAmount)

                TipCreatorViewFooter(user: self.user, onSubmit: {
                    withAnimation {
                        self.isFormPresented = false
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                        withAnimation {
                            self.isCoinAnimationPresented = true
                        }
                    }
                })
            }.opacity(self.isFormPresented ? 1 : 0)
            if self.isCoinAnimationPresented {
                CoinAnimationView(tipAmount: self.tipAmount)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                self.isCoinAnimationPresented = false
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                self.isPresented.wrappedValue = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                    self.userStore.tipUser(username: self.user.name, amount: self.tipAmount)
                                    self.tippedAmount = self.tipAmount
                                }
                            }
                        }
                }
            }
        }
    }
}

struct TipCreatorView_Previews: PreviewProvider {
    static var previews: some View {
        TipCreatorView(isPresented: .constant(true), user: Fixtures.user, tippedAmount: .constant(0))
    }
}
