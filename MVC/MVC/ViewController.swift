//
//  ViewController.swift
//  MVC
//
//  Created by Sangeeta on 27/12/24.

//  Project - MVC Pattern Demonstration
//  Model: Define the data structure (Item.swift).
//  View: Storyboard or programmatically defined UI.
//  Controller: ViewController handles both UI logic and fetching data
 


import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var items: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.dataSource = self
        setUpTableView()
        fetchItems()
    }
    
    func setUpTableView() {
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    func fetchItems() {
        //Mock API call
        items = [
            Item(id: 1, name: "Item 1"),
            Item(id: 2, name: "Item 2")
        ]
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].name
        return cell
    }
}

