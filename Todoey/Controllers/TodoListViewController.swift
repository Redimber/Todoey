//
//  ViewController.swift
//  Todoey
//
//  Created by Mountasser on 3/27/18.
//  Copyright © 2018 Mountasser. All rights reserved.
//

import UIKit

class TodoLivariewController: UITableViewController {
    var itemArray = [Item]()
    var defaults = UserDefaults.standard
    var selectedItemRow:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        let newItem = Item()
        newItem.title = "Go to school"
        itemArray.append(newItem)
        let newItem2 = Item()
        newItem2.title = "Go to home"
        itemArray.append(newItem)
        let newItem3 = Item()
        newItem3.title = "Go to gym"
        itemArray.append(newItem)
       // if let items = defaults.array(forKey: "ToDoeyItemArray") {
         //   itemArray = items as! [Items]
        //}
    }
    //MARK - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "ToDoItemCell")
        cell.textLabel?.text = itemArray[indexPath.row].title
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
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            self.defaults.setValue(self.itemArray, forKey: "ToDoeyItemArray")
            
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

