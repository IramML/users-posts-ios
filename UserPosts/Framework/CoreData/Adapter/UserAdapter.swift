//
//  UserAdapter.swift
//  UserPosts
//
//  Created by Iram Martinez on 02/10/22.
//

import Foundation

extension UserCD {
    func toUserDomain() -> User {
        return User(
            id: Int(self.id),
            name: self.name,
            username: self.username,
            email: self.email,
            phone: self.phone
        )
    }
}
