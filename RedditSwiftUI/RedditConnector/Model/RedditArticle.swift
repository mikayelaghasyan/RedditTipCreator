//
//  RedditArticle.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/18/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

extension Article: RedditObject, Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case subreddit = "subreddit_name_prefixed"
        case authorUsername = "author"
        case preview
    }

    enum PreviewCodingKeys: String, CodingKey {
        case images
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.subreddit = try container.decode(String.self, forKey: .subreddit)
        self.authorUsername = try container.decode(String.self, forKey: .authorUsername)

        var imageUrls: [String]?
        if let previewContainer = try? container.nestedContainer(keyedBy: PreviewCodingKeys.self, forKey: .preview) {
            if var imagesContainer = try? previewContainer.nestedUnkeyedContainer(forKey: .images) {
                imageUrls = []
                while !imagesContainer.isAtEnd {
                    let child = try imagesContainer.decode(RedditArticleImage.self)
                    let url = ((child.resolutions + [child.source]).last(where: { $0.width < 1000 }) ?? child.source).url
//                    let url = child.source.url
                    imageUrls?.append(url)
                }
            }
        }
        self.imageUrls = imageUrls
    }
}

struct RedditArticleImage: Decodable {
    struct Resolution: Decodable {
        let url: String
        let width: Int
        let height: Int

        enum CodingKeys: String, CodingKey {
            case url
            case width
            case height
        }

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.url = try container.decode(String.self, forKey: .url).fixUrl()
            self.width = try container.decode(Int.self, forKey: .width)
            self.height = try container.decode(Int.self, forKey: .height)
        }
    }

    let source: Resolution
    let resolutions: [Resolution]
}
