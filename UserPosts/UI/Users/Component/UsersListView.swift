//
//  UserView.swift
//  UserPosts
//
//  Created by Iram Martinez on 01/10/22.
//

import SwiftUI

struct UsersListView: View {
    @Binding var items: [User]
    var openItem: (_ item: User) -> Void
    var deleteItem: (_ offsets: IndexSet) -> Void
    
    var body: some View {
        List {
            ForEach(items) { item in
                UserItemView(user: item) { user in
                    openItem(user)
                }
            }
            .onDelete(perform: deleteItem)
        }

    }
}

struct UsersListView_Previews: PreviewProvider {
    private static let user1 = User(id: 1, name: "Leanne Graham", username: "Bret", email: "Sincere@april.biz", address: UserAddress(street: "Kulas Light", suite: "Apt. 556", city: "Gwenborough", zipcode: "92998-3874", geo: GeoLatLng(lat: "-37.3159", lng: "81.1496")), phone: "1-770-736-8031 x56442", website: "hildegard.org", company: UserCompany(name: "Romaguera-Crona", catchPhrase: "Multi-layered client-server neural-net", bs: "harness real-time e-markets"))
    @State static var items: [User] = [user1]
    
    static var previews: some View {
        UsersListView(items: $items) { item in
            
        } deleteItem: { offsets in
            
        }
    }
}
