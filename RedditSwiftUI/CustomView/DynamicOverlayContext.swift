//
//  DynamicOverlayContext.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/25/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import SwiftUI

class DynamicOverlayContext: ObservableObject {
    @Published var overlay: AnyView?

    func presentOverlay<OverlayContent>(overlay: OverlayContent) where OverlayContent: View {
        self.overlay = AnyView(overlay)
    }

    func dismissOverlay() {
        self.overlay = nil
    }
}
