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
    private var viewContext: NSManagedObjectContext
    private var getUsersFromRemoteUseCase: GetUsersFromRemoteUseCase

    @Published var items: [User] = []
    
    init(getUsersFromRemoteUseCase: GetUsersFromRemoteUseCase) {
        self.getUsersFromRemoteUseCase = getUsersFromRemoteUseCase
        self.viewContext = PersistenceController.shared.container.viewContext
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
//        let request = Item.fetchRequest()
//        request.sortDescriptors = [NSSortDescriptor(keyPath: \Item.timestamp, ascending: false)]
//        self.items = (try? self.viewContext.fetch(request)) ?? []
    }
}
