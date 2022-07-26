//
//  TipReactionView.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/26/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import SwiftUI

struct TipReactionView: View {
    @Binding var tippedAmount: Int?

    @State var opacity: Double = 0
    @State var offset: CGFloat = 0
    @State var scale: CGFloat = 0

    var body: some View {
        HStack(spacing: 5) {
            Image("dollar")
            Text(String(format: "%.02f", Double(self.tippedAmount ?? 0)))
                .semiBoldFont(size: 14)
                .foregroundColor(Color.white)
        }
        .padding(5)
        .background(Color.primary)
        .cornerRadius(20)
        .offset(y: self.offset)
        .opacity(self.opacity)
        .onAppear {
            withAnimation {
                self.opacity = 1
                self.offset = -30
                self.scale = 1
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.25) {
                withAnimation {
                    self.opacity = 0
                    self.offset = -60
                    self.scale = 0
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    self.tippedAmount = nil
                }
            }
        }
    }
}

struct TipReactionView_Previews: PreviewProvider {
    static var previews: some View {
        TipReactionView(tippedAmount: .constant(0))
    }
}
