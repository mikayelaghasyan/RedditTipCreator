//
//  ProfileImageView.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/20/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import SwiftUI

struct ProfileImageView: View {
    @Binding var imageUrl: URL?

    var body: some View {
        RemoteImage(imageUrl: self.$imageUrl)
            .clipShape(Circle())
            .frame(width: 32, height: 32)
    }
}
