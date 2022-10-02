//
//  PostsUserView.swift
//  UserPosts
//
//  Created by Iram Martinez on 01/10/22.
//

import SwiftUI

struct PostsUserView: View {
    @ObservedObject var postsViewModel: PostsViewModel
    
    init(userId: Int) {
        let usersLocalDataSouce: UsersLocalDataSource = UsersCoreDataDataSource()
        let usersRemoteDataSouce: UsersRemoteDataSource = UsersURSDataSource()
        let usersRepository: UsersRepository = UsersRepository(usersRemoteDataSource: usersRemoteDataSouce, usersLocalDataSource: usersLocalDataSouce)
        let getPostsOfUserRemoteUseCase = GetPostsOfUserRemoteUseCase(usersRepository: usersRepository)
        
        self.postsViewModel = PostsViewModel(getPostsOfUserRemoteUseCase: getPostsOfUserRemoteUseCase)
        self.postsViewModel.fetchUserPostsBy(userId: userId)
    }
    
    var body: some View {
        ZStack {
            PostsListView(userPosts: $postsViewModel.posts)
            
            if !postsViewModel.isFetching && postsViewModel.posts.count == 0 {
                Text("No posts")
            }
            
            if postsViewModel.isFetching {
                ProgressView()
            }
        }
        .navigationBarTitle("Posts")
    }
}

struct PostsUserView_Previews: PreviewProvider {
    static var previews: some View {
        PostsUserView(userId: 1)
    }
}
