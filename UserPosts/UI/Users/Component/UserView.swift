//
//  UserView.swift
//  UserPosts
//
//  Created by Iram Martinez on 01/10/22.
//

import SwiftUI

struct UserView: View {
    var item: Item
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(item.timestamp!, formatter: itemFormatter)
        }

    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(item: Item()) {
            
        }
    }
}
