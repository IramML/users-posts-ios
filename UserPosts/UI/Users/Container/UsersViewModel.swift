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

    @Published var items: [Item] = []
    
    init() {
        self.viewContext = PersistenceController.shared.container.viewContext
        self.fetchData()
    }
    
    func fetchData() {
        let request = Item.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Item.timestamp, ascending: false)]
        self.items = (try? self.viewContext.fetch(request)) ?? []
    }
    
    func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            self.fetchData()
        }
    }

    func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            self.fetchData()
        }
    }
}
