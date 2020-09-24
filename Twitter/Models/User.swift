//
//  User.swift
//  Twitter
//
//  Created by Mewtru on 9/23/20.
//

import Foundation

struct User: Codable, Hashable, Equatable {
    let id: Int
    let name: String
    let avatar: URL?
}
