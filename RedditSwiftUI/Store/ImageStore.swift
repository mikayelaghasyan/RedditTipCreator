//
//  ImageStore.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/20/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import UIKit
import Combine

class ImageStore: ObservableObject {
    @Published var imageMap: [URL: UIImage] = [:]
    
    var imageMapPublisher: AnyPublisher<[URL: UIImage], Never> {
        return self.$imageMap.receive(on: DispatchQueue.main).eraseToAnyPublisher()
    }

    func loadImage(imageUrl: URL, scale: CGFloat) {
        guard !self.imageMap.keys.contains(imageUrl) else { return }
        let publisher = URLSession.shared.dataTaskPublisher(for: imageUrl)
        _ = publisher
            .map {
                UIImage(data: $0.data, scale: scale)
            }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] image in
                self?.imageMap[imageUrl] = image
            }
    }
}
