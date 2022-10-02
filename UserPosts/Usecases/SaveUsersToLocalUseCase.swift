//
//  SaveUsersToLocalUseCase.swift
//  UserPosts
//
//  Created by Iram Martinez on 02/10/22.
//

import Foundation

class SaveUsersToLocalUseCase {
    private var usersRepository: UsersRepository
    
    init(usersRepository: UsersRepository) {
        self.usersRepository = usersRepository
    }
    
    func invoke(_ users: [User]) -> Bool {
        return self.usersRepository.saveUsersToLocal(users)
    }
}
