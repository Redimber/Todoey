//
//  AppDelegate.swift
//  Todoey
//
//  Created by Mountasser on 3/27/18.
//  Copyright © 2018 Mountasser. All rights reserved.
//

import UIKit
import RealmSwift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //print(Realm.Configuration.defaultConfiguration.fileURL)
        do {
            _ = try Realm()
        }catch {
            print("Initialising error : \(error)")
        }
        return true
    }


    
}



