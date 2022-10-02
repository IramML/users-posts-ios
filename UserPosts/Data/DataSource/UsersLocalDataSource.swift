//
//  UsersLocalDataSource.swift
//  UserPosts
//
//  Created by Iram Martinez on 02/10/22.
//

import Foundation

protocol UsersLocalDataSource {
    func getUsers(_ completion: @escaping ([User], LocalError?) -> Void)
    func saveUsers(_ users: [User]) -> Bool
}
