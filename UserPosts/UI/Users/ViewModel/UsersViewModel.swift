//
//  UsersViewModel.swift
//  UserPosts
//
//  Created by Iram Martinez on 01/10/22.
//

import Foundation
import SwiftUI
import CoreData

class UsersViewModel: ObservableObject {
    private var getUsersFromRemoteUseCase: GetUsersFromRemoteUseCase
    private var getUsersFromLocalUseCase: GetUsersFromLocalUseCase

    @Published var items: [User] = []
    
    init(getUsersFromRemoteUseCase: GetUsersFromRemoteUseCase, getUsersFromLocalUseCase: GetUsersFromLocalUseCase) {
        self.getUsersFromRemoteUseCase = getUsersFromRemoteUseCase
        self.getUsersFromLocalUseCase = getUsersFromLocalUseCase
        
        self.fetchData()
    }
    
    func fetchData() {
        getUsersFromRemoteUseCase.invoke { [weak self] (users, error) in
            if let _ = error {
                self?.items = []
            }
            
            if let users = users {
                self?.items = users
            }
            
        }
    }
}
