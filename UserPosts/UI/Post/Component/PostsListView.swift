//
//  PostsListView.swift
//  UserPosts
//
//  Created by Iram Martinez on 02/10/22.
//

import SwiftUI

struct PostsListView: View {
    @Binding var userPosts: [UserPost]
    
    var body: some View {
        List {
            ForEach(userPosts) { post in
                PostView(userPost: post)
            }
            
        }
    }
}

struct PostsListView_Previews: PreviewProvider {
    private static var post = UserPost(userId: 1, id: 1, title: "This is a title", body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry")
    @State private static var posts = [post, post]
    
    static var previews: some View {
        PostsListView(userPosts: $posts)
    }
}
