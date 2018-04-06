//
//  CategoryTableViewController.swift
//  Todoey
//
//  Created by Mountasser on 4/5/18.
//  Copyright © 2018 Mountasser. All rights reserved.
//

import UIKit
import CoreData
class CategoryTableViewController: UITableViewController {
    var categoryArray = [Category]()
    let context = (UIApplication.shared.delegate as! AppDelegate) .persistentContainer.viewContext

    override func viewDidLoad() {

        super.viewDidLoad()
        loadData()
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Categorycell")
        let category = categoryArray[indexPath.row]
        cell.textLabel?.text = category.name
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let distanationVC = segue.destination as! TodoListViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            distanationVC.selectedCategory = categoryArray[indexPath.row]
        }
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textFieldCat = UITextField()
        let alert = UIAlertController(title: "Add Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            let newCategory = Category(context: self.context)
            newCategory.name = textFieldCat.text!
            self.categoryArray.append(newCategory)
            self.saveCategories()
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Add new category"
            textFieldCat = textField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    func saveCategories() {
        do {
            try context.save()
        }catch {
            print("saving error \(error)")
        }
        tableView.reloadData()
    }
    func loadData(with request : NSFetchRequest<Category> = Category.fetchRequest()) {
        do {
            categoryArray = try context.fetch(request)
        }catch {
            print("fetching error \(error)")
        }
        tableView.reloadData()
        
    }
    
}
