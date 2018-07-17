//
//  ViewController.swift
//  Todoey
//
//  Created by Pedro da Cunha on 17/07/2018.
//  Copyright © 2018 Pedro da Cunha. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items
        }
        let newItem = Item()
        newItem.title = "Task1"
        itemArray.append(newItem)
        let newItem1 = Item()
        newItem1.title = "Task2"
        itemArray.append(newItem1)
        let newItem2 = Item()
        newItem2.title = "Task3"
        itemArray.append(newItem2)
        

}

    //MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].title
        
        cell.accessoryType = itemArray[indexPath.row].done ? .checkmark : .none
        
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemArray.count
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // toggle done flag
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add new Todoey item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what will happen when the user clicks Add Item in the Alert Controller
            let yetANewItem = Item()
            yetANewItem.title = alert.textFields![0].text!
            self.itemArray.append(yetANewItem)
            
            //self.defaults.set(self.itemArray, forKey: "ItemListArray")
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    
}

