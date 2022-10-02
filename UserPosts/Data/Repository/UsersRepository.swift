//
//  UsersRepository.swift
//  UserPosts
//
//  Created by Iram Martinez on 02/10/22.
//

import Foundation

class UsersRepository {
    private var usersRemoteDataSource: UsersRemoteDataSource
    
    init(usersRemoteDataSource: UsersRemoteDataSource) {
        self.usersRemoteDataSource = usersRemoteDataSource
    }
    
    func getUsersFromRemote(_ completion: @escaping ([User]?, RemoteError?) -> Void) {
        self.usersRemoteDataSource.getUsers(completion)
    }
}
