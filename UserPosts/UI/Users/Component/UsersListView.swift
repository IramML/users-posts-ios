//
//  UserView.swift
//  UserPosts
//
//  Created by Iram Martinez on 01/10/22.
//

import SwiftUI

struct UsersListView: View {
    @Binding var items: [Item]
    var openItem: (_ item: Item) -> Void
    var deleteItem: (_ offsets: IndexSet) -> Void
    
    var body: some View {
        List {
            ForEach(items) { item in
                Button {
                    openItem(item)
                } label: {
                    Text(item.timestamp!, formatter: itemFormatter)
                }
            }
            .onDelete(perform: deleteItem)
        }

    }
}

struct UsersListView_Previews: PreviewProvider {
    @State static var items: [Item] = [Item(), Item()]
    
    static var previews: some View {
       
        UsersListView(items: $items) { item in
            
        } deleteItem: { offsets in
            
        }

    }
}
