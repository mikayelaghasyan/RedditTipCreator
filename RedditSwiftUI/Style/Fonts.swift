//
//  Fonts.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/24/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import SwiftUI

struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String
    var size: CGFloat

    func body(content: Content) -> some View {
        let scaledSize = UIFontMetrics.default.scaledValue(for: self.size)
        return content.font(.custom(self.name, size: scaledSize))
    }
}

extension View {
    func scaledFont(name: String, size: CGFloat) -> some View {
        return self.modifier(ScaledFont(name: name, size: size))
    }

    func mediumFont(size: CGFloat) -> some View {
        return self.scaledFont(name: "IBMPlexSans-Medium", size: size)
    }
    
    func boldFont(size: CGFloat) -> some View {
        return self.scaledFont(name: "IBMPlexSans-Bold", size: size)
    }
    
    func semiBoldFont(size: CGFloat) -> some View {
        return self.scaledFont(name: "IBMPlexSans-SemiBold", size: size)
    }
}
