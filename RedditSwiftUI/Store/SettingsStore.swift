//
//  SettingsStore.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/25/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import Combine

class SettingsStore: ObservableObject {
    @Published var creditCards: [CreditCard] = [
        CreditCard(cardType: .visa, lastFourDigits: "0741"),
        CreditCard(cardType: .mastercard, lastFourDigits: "3088")
    ]

    @Published var selectedCreditCard: CreditCard?

    init() {
        self.selectedCreditCard = self.creditCards.first
    }
}
