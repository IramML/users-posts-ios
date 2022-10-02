//
//  PostView.swift
//  UserPosts
//
//  Created by Iram Martinez on 01/10/22.
//

import SwiftUI

struct PostView: View {
    var userPost: UserPost
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(userPost.title)
                .font(.headline)
                .bold()
            Text(userPost.body)
                .font(.body)
        }
        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
        
    }
}

struct PostView_Previews: PreviewProvider {
    private static let post = UserPost(userId: 1, id: 1, title: "This is a title", body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry")
    
    static var previews: some View {
        PostView(userPost: post)
    }
}
