//
//  RemoteImage.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/20/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import SwiftUI
import UIKit

struct RemoteImage: View {
    @Environment(\.displayScale) var displayScale

    @EnvironmentObject var imageStore: ImageStore
    @Binding var imageUrl: URL?

    var image: UIImage? {
        guard let url = self.imageUrl else { return nil }
        return self.imageStore.imageMap[url]
    }

    var body: some View {
        Group {
            if self.imageUrl != nil {
                ZStack {
                    Group {
                        if self.image != nil {
                            Image(uiImage: self.image!)
                                .resizable()
                                .scaledToFit()
                        }
                    }
                }.onAppear {
                    self.imageStore.loadImage(imageUrl: self.imageUrl!, scale: self.displayScale)
                }
            }
        }
    }
}
