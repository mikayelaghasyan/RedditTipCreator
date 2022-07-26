//
//  ExpandedCreditCardsView.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/25/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import SwiftUI

struct ExpandedCreditCardsView: View {
    @EnvironmentObject var settingsStore: SettingsStore

    var onTap: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            ForEach(self.settingsStore.creditCards) { creditCard in
                CreditCardRow(creditCard: creditCard, isSelected: (creditCard == self.settingsStore.selectedCreditCard), onSelect: { creditCard in
                    self.settingsStore.selectedCreditCard = creditCard
                    self.onTap()
                })
            }
            AddCreditCardRow {
                self.onTap()
            }
        }
        .background(RoundedRectangle(cornerRadius: 4)
        .stroke(Color.lightGray))
        .padding(.bottom, 12)
    }
}

struct ExpandedCreditCardsView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandedCreditCardsView(onTap: { })
    }
}
