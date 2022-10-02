//
//  PostsViewModel.swift
//  UserPosts
//
//  Created by Iram Martinez on 02/10/22.
//

import Foundation
import SwiftUI

class PostsViewModel: ObservableObject {
    @Published var isFetching = false
    @Published var posts: [UserPost] = []
    private var getPostsOfUserRemoteUseCase: GetPostsOfUserRemoteUseCase
    
    init(getPostsOfUserRemoteUseCase: GetPostsOfUserRemoteUseCase) {
        self.getPostsOfUserRemoteUseCase = getPostsOfUserRemoteUseCase
    }
    
    func fetchUserPostsBy(userId: Int) {
        self.isFetching = true
        self.getPostsOfUserRemoteUseCase.invoke(userId: userId) { [weak self] (posts, error) in
            self?.isFetching = false
            if let _ = error {
                self?.posts = []
            }
            
            if let posts = posts {
                self?.posts = posts
            }
        }
    }
}
