//
//  UsersCoreDataDataSource.swift
//  UserPosts
//
//  Created by Iram Martinez on 02/10/22.
//

import Foundation
import CoreData

class UsersCoreDataDataSource: UsersLocalDataSource {
    private var viewContext: NSManagedObjectContext
    
    init() {
        self.viewContext = PersistenceController.shared.container.viewContext
    }
    
    func getUsers(_ completion: @escaping ([User], LocalError?) -> Void) {
        let request = UserCD.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \UserCD.id, ascending: false)]
        let usersCoreData = (try? self.viewContext.fetch(request)) ?? []
        completion((usersCoreData.map { $0.toUserDomain() }), nil)
    }
    
    func saveUsers(_ users: [User]) -> Bool {
        users.forEach { user in
            let userCodeData = UserCD(context: self.viewContext)
            userCodeData.id = Int16(user.id)
            userCodeData.name = user.name
            userCodeData.username = user.username
            userCodeData.phone = user.phone
            userCodeData.email = user.email
        }
        
        do {
            try self.viewContext.save()
            return true
        } catch {
            return false
        }
        
    }
    
    
}
