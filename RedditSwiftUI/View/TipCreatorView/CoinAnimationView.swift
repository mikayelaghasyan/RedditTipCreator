//
//  CoinAnimationView.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/25/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import SwiftUI

struct CoinAnimationView: View {
    let tipAmount: Int

    @State var flipped = false
    @State var animate = false
    
    var body: some View {
        let binding = Binding<Bool>(get: { self.flipped }, set: { self.flipped = $0 })
        return ZStack {
            Circle()
                .fill(Color.primary)
                .frame(width: 65, height: 65)
            if self.flipped {
                Image("logo")
            } else {
                Text("$\(self.tipAmount)")
                    .foregroundColor(.white)
                    .textStyle(TitleStyle())
            }
        }
        .modifier(FlipEffect(flipped: binding, angle: animate ? 360 : 0, axis: (x: 0, y: 1)))
        .onAppear {
            withAnimation(Animation.linear(duration: 2.0).repeatForever(autoreverses: false)) {
                self.animate = true
            }
        }
    }
}

struct CoinAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CoinAnimationView(tipAmount: 5)
    }
}
