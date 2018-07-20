
//
//  Category.swift
//  Todoey
//
//  Created by Pedro da Cunha on 19/07/2018.
//  Copyright © 2018 Pedro da Cunha. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}

