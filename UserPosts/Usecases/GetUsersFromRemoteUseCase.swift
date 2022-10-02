//
//  GetUsersFromRemoteUseCase.swift
//  UserPosts
//
//  Created by Iram Martinez on 02/10/22.
//

import Foundation

class GetUsersFromRemoteUseCase {
    private var usersRepository: UsersRepository
    
    init(usersRepository: UsersRepository) {
        self.usersRepository = usersRepository
    }
    
    func invoke(_ completion: @escaping ([User]?, RemoteError?) -> Void) {
        self.usersRepository.getUsersFromRemote(completion)
    }
}
