//
//  Item.swift
//  Todoey
//
//  Created by Mountasser on 3/31/18.
//  Copyright © 2018 Mountasser. All rights reserved.
//

import Foundation
class Item: Encodable, Decodable {
    var title:String = ""
    var done:Bool = false
}
