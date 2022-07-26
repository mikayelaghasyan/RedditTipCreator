//
//  ButtonStyles.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/24/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .textStyle(PrimaryButtonTitleStyle())
            .frame(maxWidth: .infinity, minHeight: 40)
            .padding(.horizontal)
            .background(Color.primary)
            .cornerRadius(4)
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}

struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .textStyle(ContentStyle())
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}

struct TitleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .textStyle(TitleStyle())
            .accentColor(.title)
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}

struct LinkButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .textStyle(LinkStyle())
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}

struct StepperButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .textStyle(LargeTitleStyle())
            .frame(maxWidth: .infinity, minHeight: 64)
            .background(Color.lightGray)
            .cornerRadius(4)
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}
