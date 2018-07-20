//
//  Item.swift
//  Todoey
//
//  Created by Pedro da Cunha on 19/07/2018.
//  Copyright © 2018 Pedro da Cunha. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}

