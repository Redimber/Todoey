//
//  Item.swift
//  Todoey
//
//  Created by Mountasser on 4/7/18.
//  Copyright © 2018 Mountasser. All rights reserved.
//

import Foundation
import RealmSwift
class Item: Object {
    @objc dynamic var name:String = ""
    @objc dynamic var done:Bool = false
    @objc dynamic var dateCreated:Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
