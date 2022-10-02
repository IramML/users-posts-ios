//
//  User.swift
//  UserPosts
//
//  Created by Iram Martinez on 02/10/22.
//

import Foundation

struct User: Codable, Identifiable {
    var id: Int
    var name: String
    var username: String
    var email: String
    var phone: String
}

