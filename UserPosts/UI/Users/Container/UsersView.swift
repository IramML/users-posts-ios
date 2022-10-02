//
//  ContentView.swift
//  UserPosts
//
//  Created by Iram Martinez on 01/10/22.
//

import SwiftUI
import CoreData

struct UsersView: View {
    @ObservedObject var usersViewModel: UsersViewModel

    @State var showUserPost: Bool = false
    @State var userToShow: User? = nil
    
    init() {
        let usersRemoteDatasource: UsersRemoteDataSource = UsersURSDataSource()

        let usersRepository = UsersRepository(usersRemoteDataSource: usersRemoteDatasource)
        
        let getUsersFromRemoteUseCase: GetUsersFromRemoteUseCase = GetUsersFromRemoteUseCase(usersRepository: usersRepository)
      
        self.usersViewModel = UsersViewModel(getUsersFromRemoteUseCase: getUsersFromRemoteUseCase)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                UsersListView(items: $usersViewModel.items) { item in
                    userToShow = item
                    showUserPost = true
                }
                
                if usersViewModel.items.count == 0 {
                    Text("No users")
                }
                
                if let userToShow = userToShow {
                    NavigationLink(
                        destination: PostsUserView(userId: userToShow.id),
                        isActive: $showUserPost,
                        label: {
                            EmptyView()
                            
                        })
                }
            }
            .navigationBarTitle("Users")
            
        }
        
    }

   
}

let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
