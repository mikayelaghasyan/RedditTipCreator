//
//  CreditCard.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/25/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import Foundation

struct CreditCard: Identifiable {
    enum CardType: String {
        case visa = "VISA"
        case mastercard = "Mastercard"
    }

    let id: String = UUID().uuidString
    let cardType: CardType
    let lastFourDigits: String
}

extension CreditCard: Hashable {
}
