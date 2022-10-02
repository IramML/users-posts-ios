//
//  User.swift
//  UserPosts
//
//  Created by Iram Martinez on 02/10/22.
//

import Foundation

struct User: Codable {
    var id: Int
    var name: String
    var username: String
    var email: String
    var address: UserAddress
    var phone: String
    var website: String
    var company: UserCompany
}

struct UserAddress: Codable {
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var geo: GeoLatLng
}

struct GeoLatLng: Codable {
    var lat: Double
    var lng: Double
}

struct UserCompany: Codable {
    var name: String
    var catchPhrase: String
    var bs: String
}

