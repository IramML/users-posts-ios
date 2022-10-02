//
//  GetUsersFromLocalUseCase.swift
//  UserPosts
//
//  Created by Iram Martinez on 02/10/22.
//

import Foundation

class GetUsersFromLocalUseCase {
    private var usersRepository: UsersRepository
    
    init(usersRepository: UsersRepository) {
        self.usersRepository = usersRepository
    }
    
    func invoke(_ completion: @escaping ([User]?, LocalError?) -> Void) {
        self.usersRepository.getUsersFromLocal(completion)
    }
}
