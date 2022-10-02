//
//  UserItemView.swift
//  UserPosts
//
//  Created by Iram Martinez on 02/10/22.
//

import SwiftUI

struct UserItemView: View {
    var user: User
    var openItem: (User) -> Void
    
    var body: some View {
        Button {
            openItem(user)
        } label: {
            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.headline.bold())
                    .foregroundColor(Color(UIColor.label))
                
                HStack {
                    Image(systemName: "phone")
                        .foregroundColor(Color(UIColor.label))
                    Text(user.phone)
                        .font(.body)
                        .foregroundColor(Color(UIColor.label))
                }
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(Color(UIColor.label))
                    Text(user.email)
                        .font(.body)
                        .foregroundColor(Color(UIColor.label))
                }
                HStack {
                    Spacer()
                    Text("Ver publicación")
                        .font(.body.bold())
                        .foregroundColor(Color(UIColor.label))
                        
                }
            }
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
    }
}

struct UserItemView_Previews: PreviewProvider {
    private static let user = User(id: 1, name: "Leanne Graham", username: "Bret", email: "Sincere@april.biz", phone: "1-770-736-8031 x56442")
    static var previews: some View {
        UserItemView(user: user) {_ in
            
        }
    }
}
