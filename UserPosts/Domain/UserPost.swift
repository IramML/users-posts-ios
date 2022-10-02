//
//  UserPost.swift
//  UserPosts
//
//  Created by Iram Martinez on 02/10/22.
//

import Foundation

struct UserPost: Identifiable, Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
