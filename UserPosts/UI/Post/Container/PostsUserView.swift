//
//  PostsUserView.swift
//  UserPosts
//
//  Created by Iram Martinez on 01/10/22.
//

import SwiftUI

struct PostsUserView: View {
    var body: some View {
        ZStack {
            List {
                PostView()
            }
        }
    }
}

struct PostsUserView_Previews: PreviewProvider {
    static var previews: some View {
        PostsUserView()
    }
}
