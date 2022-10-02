//
//  UsersRemoteDataSource.swift
//  UserPosts
//
//  Created by Iram Martinez on 02/10/22.
//

import Foundation

protocol UsersRemoteDataSource {
    func getUsers(_ completion: @escaping ([User]?, RemoteError?) -> Void)
    func getPostsOfUser(userId: Int, _ completion: @escaping ([UserPost]?, RemoteError?) -> Void)
}
