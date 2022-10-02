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
        let usersLocalDatasource: UsersLocalDataSource = UsersCoreDataDataSource()
        let usersRemoteDatasource: UsersRemoteDataSource = UsersURSDataSource()
       
        let usersRepository = UsersRepository(usersRemoteDataSource: usersRemoteDatasource, usersLocalDataSource: usersLocalDatasource)
        
        let getUsersFromRemoteUseCase: GetUsersFromRemoteUseCase = GetUsersFromRemoteUseCase(usersRepository: usersRepository)
        let getUsersFromLocalUseCase: GetUsersFromLocalUseCase = GetUsersFromLocalUseCase(usersRepository: usersRepository)
        let saveUsersToLocalUseCase: SaveUsersToLocalUseCase = SaveUsersToLocalUseCase(usersRepository: usersRepository)
      
        self.usersViewModel = UsersViewModel(
            getUsersFromRemoteUseCase: getUsersFromRemoteUseCase,
            getUsersFromLocalUseCase: getUsersFromLocalUseCase,
            saveUsersToLocalUseCase: saveUsersToLocalUseCase)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                UsersListView(items: $usersViewModel.items) { item in
                    userToShow = item
                    showUserPost = true
                }
                
                if !usersViewModel.isFetching && usersViewModel.items.count == 0 {
                    Text("No users")
                }
                
                if usersViewModel.isFetching {
                    ProgressView()
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
