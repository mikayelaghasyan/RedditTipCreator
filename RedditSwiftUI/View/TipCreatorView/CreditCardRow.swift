//
//  CreditCardRow.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/25/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import SwiftUI

struct CreditCardRow: View {
    let creditCard: CreditCard
    let isSelected: Bool

    let onSelect: (CreditCard) -> Void

    var body: some View {
        Button(action: {
            self.onSelect(self.creditCard)
        }) {
            HStack(spacing: 0) {
                Image("lock").padding(.horizontal, 16)
                Text("\(self.creditCard.cardType.rawValue)  **** \(self.creditCard.lastFourDigits)")
                    .mediumFont(size: 16)
                Spacer()
                if self.isSelected {
                    Image("check").padding(.horizontal, 16)
                }
            }
        }
        .buttonStyle(TitleButtonStyle())
        .frame(maxWidth: .infinity, minHeight: 48)
    }
}

struct SelectedCreditCardRow: View {
    let creditCard: CreditCard

    let onSelect: () -> Void

    var body: some View {
        Button(action: {
            self.onSelect()
        }) {
            HStack(spacing: 0) {
                Image("lock").padding(.horizontal, 16)
                Text("\(self.creditCard.cardType.rawValue)  **** \(self.creditCard.lastFourDigits)")
                    .mediumFont(size: 16)
                Spacer()
            }
        }
        .buttonStyle(LinkButtonStyle())
        .frame(maxWidth: .infinity, minHeight: 48)
    }
}

struct AddCreditCardRow: View {
    let onSelect: () -> Void

    var body: some View {
        Button(action: {
            self.onSelect()
        }) {
            HStack(spacing: 0) {
                Image("add").padding(.horizontal, 16)
                Text("Add New Card")
                    .mediumFont(size: 16)
                Spacer()
            }
        }
        .buttonStyle(TitleButtonStyle())
        .frame(maxWidth: .infinity, minHeight: 48)
    }
}

struct CreditCardRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CreditCardRow(creditCard: Fixtures.creditCard, isSelected: false, onSelect: { _ in })
            SelectedCreditCardRow(creditCard: Fixtures.creditCard, onSelect: { })
            AddCreditCardRow(onSelect: { })
        }
    }
}
