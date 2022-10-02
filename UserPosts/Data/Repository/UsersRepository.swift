//
//  UsersRepository.swift
//  UserPosts
//
//  Created by Iram Martinez on 02/10/22.
//

import Foundation

class UsersRepository {
    private var usersRemoteDataSource: UsersRemoteDataSource
    private var usersLocalDataSource: UsersLocalDataSource
    
    init(usersRemoteDataSource: UsersRemoteDataSource, usersLocalDataSource: UsersLocalDataSource) {
        self.usersRemoteDataSource = usersRemoteDataSource
        self.usersLocalDataSource = usersLocalDataSource
    }
    
    func getUsersFromRemote(_ completion: @escaping ([User]?, RemoteError?) -> Void) {
        self.usersRemoteDataSource.getUsers(completion)
    }
    
    func getRemoteUserPostsBy(userId: Int, completion: @escaping ([UserPost]?, RemoteError?) -> Void) {
        self.usersRemoteDataSource.getPostsOfUser(userId: userId, completion)
    }
    
    func getUsersFromLocal(_ completion: @escaping ([User]?, LocalError?) -> Void) {
        self.usersLocalDataSource.getUsers(completion)
    }
    
    func saveUsersToLocal(_ users: [User]) -> Bool {
        self.usersLocalDataSource.saveUsers(users)
    }
}
