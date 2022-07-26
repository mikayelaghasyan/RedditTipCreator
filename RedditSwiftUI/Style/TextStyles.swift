//
//  TextStyles.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/24/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import SwiftUI

struct TitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .mediumFont(size: 18)
            .foregroundColor(.title)
    }
}

struct ContentStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .mediumFont(size: 13)
            .foregroundColor(.secondary)
    }
}

struct HeaderStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .boldFont(size: 10)
            .foregroundColor(.secondary)
    }
}

struct PrimaryButtonTitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .boldFont(size: 14)
            .foregroundColor(.white)
    }
}

struct BodyStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .mediumFont(size: 12)
            .foregroundColor(.darkGray)
    }
}

struct LinkStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .mediumFont(size: 12)
            .foregroundColor(.link)
    }
}

struct LargeTitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .mediumFont(size: 22)
            .foregroundColor(.title)
    }
}

extension View {
    func textStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}
