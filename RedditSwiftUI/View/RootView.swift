//
//  RootView.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/16/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var dynamicOverlayContext: DynamicOverlayContext

    var body: some View {
        ZStack {
            ArticleListView()
            if self.dynamicOverlayContext.overlay != nil {
                self.dynamicOverlayContext.overlay!
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
