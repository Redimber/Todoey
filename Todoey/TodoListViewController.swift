//
//  ViewController.swift
//  Todoey
//
//  Created by Mountasser on 3/27/18.
//  Copyright © 2018 Mountasser. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    let itemArray = ["find Mike", "Buy Eggos", "Destory Demogorgon"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //MARK - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "ToDoItemCell")
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    //MARK - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        if tableView.cellForRow(at: indexPath)?.accessoryType != .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark

        } else {
           tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        tableView.deselectRow(at: indexPath, animated: true)
        

    }


}

