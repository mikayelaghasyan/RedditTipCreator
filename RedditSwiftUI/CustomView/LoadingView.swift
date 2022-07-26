//
//  LoadingView.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/18/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                VStack {
                    Text("Loading...")
                        .textStyle(TitleStyle())
                    ActivityIndicator(isAnimating: .constant(true), style: .large)
                }
                .frame(width: geometry.size.width / 2,
                       height: geometry.size.height / 5)
                .background(Color.title.colorInvert())
                .foregroundColor(Color.title)
                .cornerRadius(20)
            }
        }
    }
}
