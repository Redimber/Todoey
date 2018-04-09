//
//  Category.swift
//  Todoey
//
//  Created by Mountasser on 4/7/18.
//  Copyright © 2018 Mountasser. All rights reserved.
//

import Foundation
import RealmSwift
class Category: Object {
    @objc dynamic var name:String = ""
    var items = List<Item>()
}
