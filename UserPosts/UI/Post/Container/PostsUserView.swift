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
        let usersRemoteDataSouce: UsersRemoteDataSource = UsersURSDataSource()
        let usersRepository: UsersRepository = UsersRepository(usersRemoteDataSource: usersRemoteDataSouce)
        let getPostsOfUserRemoteUseCase = GetPostsOfUserRemoteUseCase(usersRepository: usersRepository)
        
        self.postsViewModel = PostsViewModel(getPostsOfUserRemoteUseCase: getPostsOfUserRemoteUseCase)
        self.postsViewModel.fetchUserPostsBy(userId: userId)
    }
    
    var body: some View {
        ZStack {
            PostsListView(userPosts: $postsViewModel.posts)
        }
        .navigationBarTitle("Posts")
    }
}

struct PostsUserView_Previews: PreviewProvider {
    static var previews: some View {
        PostsUserView(userId: 1)
    }
}
