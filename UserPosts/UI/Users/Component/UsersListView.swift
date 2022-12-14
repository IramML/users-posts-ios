//
//  UserView.swift
//  UserPosts
//
//  Created by Iram Martinez on 01/10/22.
//

import SwiftUI

struct UsersListView: View {
    @Binding var items: [User]
    @Binding var textFilter: String
    var openItem: (_ item: User) -> Void
    
    var body: some View {
        List {
            ForEach(items) { item in
                if textFilter == "" || item.name.contains(textFilter) {
                    UserItemView(user: item) { user in
                        openItem(user)
                    }
                }
                
            }
        }

    }
}

struct UsersListView_Previews: PreviewProvider {
    private static let user1 = User(id: 1, name: "Leanne Graham", username: "Bret", email: "Sincere@april.biz", phone: "1-770-736-8031 x56442")
    @State static var items: [User] = [user1]
    @State static var textFilter = ""
    
    static var previews: some View {
        UsersListView(items: $items, textFilter: $textFilter) { item in
            
        }
    }
}
