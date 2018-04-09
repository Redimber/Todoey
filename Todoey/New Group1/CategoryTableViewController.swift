//
//  CategoryTableViewController.swift
//  Todoey
//
//  Created by Mountasser on 4/5/18.
//  Copyright © 2018 Mountasser. All rights reserved.
//

import UIKit
import RealmSwift
class CategoryTableViewController: UITableViewController {
    var categories:Results<Category>?
    let realm = try! Realm()
    override func viewDidLoad() {

        super.viewDidLoad()
        loadData()
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Categorycell")
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No categories added yet"
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let distanationVC = segue.destination as! TodoListViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            distanationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textFieldCat = UITextField()
        let alert = UIAlertController(title: "Add Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            let newCategory = Category()
            newCategory.name = textFieldCat.text!
            self.save(category: newCategory)
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Add new category"
            textFieldCat = textField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    func save(category: Category) {
        do {
            try realm.write {
                 realm.add(category)
            }
        }catch {
            print("saving error \(error)")
        }
        tableView.reloadData()
    }
    func loadData() {
        categories = realm.objects(Category.self)
        tableView.reloadData()

    }
    
}
