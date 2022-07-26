//
//  CollapsedCreditCardsView.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/25/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import SwiftUI

struct CollapsedCreditCardsView: View {
    @EnvironmentObject var settingsStore: SettingsStore

    var selectedCreditCard: CreditCard? {
        self.settingsStore.selectedCreditCard
    }

    var onTap: () -> Void

    var body: some View {
        Group {
            if self.selectedCreditCard != nil {
                SelectedCreditCardRow(creditCard: self.selectedCreditCard!, onSelect: {
                    self.onTap()
                })
            } else {
                AddCreditCardRow {
                    self.onTap()
                }
            }
        }
    }
}

struct CollapsedCreditCardsView_Previews: PreviewProvider {
    static var previews: some View {
        CollapsedCreditCardsView(onTap: { })
    }
}
