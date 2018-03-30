//
//  ViewController.swift
//  Todoey
//
//  Created by Mountasser on 3/27/18.
//  Copyright © 2018 Mountasser. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    var itemArray = ["find Mike", "Buy Eggos", "Destory Demogorgon"]
    var selectedItemRow:Int = 0
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
            selectedItemRow = indexPath.row

        } else {
           tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        tableView.deselectRow(at: indexPath, animated: true)
        

    }
    //MARK - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item ", style: .default) { (action) in
            // what will happen after the user clicks add Item Button
            print("success !")
            print(textField.text)
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new Item!"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func deleteButtonPressed(_ sender: UIBarButtonItem) {
        itemArray.remove(at: selectedItemRow)
        tableView.reloadData()

        
    }
    


}

