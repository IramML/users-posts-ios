//
//  GetPostsOfUserRemoteUseCase.swift
//  UserPosts
//
//  Created by Iram Martinez on 02/10/22.
//

import Foundation

class GetPostsOfUserRemoteUseCase {
    private var usersRepository: UsersRepository
    
    init(usersRepository: UsersRepository) {
        self.usersRepository = usersRepository
    }
    
    func invoke(userId: Int, completion: @escaping ([UserPost]?, RemoteError?) -> Void) {
        self.usersRepository.getUserPostsBy(userId: userId, completion: completion)
    }
}
