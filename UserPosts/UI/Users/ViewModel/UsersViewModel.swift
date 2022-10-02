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
    private var saveUsersToLocalUseCase: SaveUsersToLocalUseCase

    @Published var isFetching = false
    @Published var items: [User] = []
    
    init(
        getUsersFromRemoteUseCase: GetUsersFromRemoteUseCase,
        getUsersFromLocalUseCase: GetUsersFromLocalUseCase,
        saveUsersToLocalUseCase: SaveUsersToLocalUseCase
    ) {
        self.getUsersFromRemoteUseCase = getUsersFromRemoteUseCase
        self.getUsersFromLocalUseCase = getUsersFromLocalUseCase
        self.saveUsersToLocalUseCase = saveUsersToLocalUseCase
        
        self.fetchData()
    }
    
    func fetchData() {
        self.isFetching = true
        
        self.getUsersFromLocalUseCase.invoke { [weak self] users, error in
            if let _ = error {
                self?.fetchDataFromRemote()
            }
            
            if let users = users, users.count > 0 {
                self?.isFetching = false
                self?.items = users
            } else {
                self?.fetchDataFromRemote()
            }
        }
        
        
    }
    
    private func fetchDataFromRemote() {
        self.getUsersFromRemoteUseCase.invoke { [weak self] (users, error) in
            self?.isFetching = false
            if let _ = error {
                self?.items = []
            }
            
            if let users = users {
                self?.items = users
                _ = self?.saveUsersToLocalUseCase.invoke(users)
            }
            
        }
    }
}
