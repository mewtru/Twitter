//
//  Tweet.swift
//  Twitter
//
//  Created by Mewtru on 9/23/20.
//

import Foundation

struct TweetsResponse: Codable {
    let tweets: [Tweet]
}

struct Tweet: Codable, Hashable, Equatable {
    let id: Int
    let text: String
    let user: User
}
