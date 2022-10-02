//
//  UserCD+CoreDataProperties.swift
//  UserPosts
//
//  Created by Iram Martinez on 02/10/22.
//
//

import Foundation
import CoreData


extension UserCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserCD> {
        return NSFetchRequest<UserCD>(entityName: "UserCD")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String
    @NSManaged public var username: String
    @NSManaged public var email: String
    @NSManaged public var phone: String

}

extension UserCD : Identifiable {

}
