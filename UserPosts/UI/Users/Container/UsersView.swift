//
//  ContentView.swift
//  UserPosts
//
//  Created by Iram Martinez on 01/10/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @ObservedObject var usersViewModel = UsersViewModel()
    @State var showUserPost: Bool = false
    @State var userToShow: Item? = nil
    
    var body: some View {
        NavigationView {
            ZStack {
                UsersListView(items: $usersViewModel.items) { item in
                    userToShow = item
                    showUserPost = true
                } deleteItem: { offsets in
                    usersViewModel.deleteItems(offsets: offsets)
                }
                
                if let userToShow = userToShow {
                    NavigationLink(
                        destination: Text("Item at \(userToShow.timestamp!, formatter: itemFormatter)"),
                        isActive: $showUserPost,
                        label: {
                            EmptyView()
                            
                        })
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: usersViewModel.addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
    }

   
}

let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
