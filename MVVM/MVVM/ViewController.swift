//
//  ViewController.swift
//  MVVM
//
//  Created by Sangeeta on 27/12/24.
//
//  Project: MVVM Pattern
//  Model: Define data structure (Item.swift).
//  ViewModel: Handles fetching data and transforming it for the view (ItemViewModel.swift).
//  View: The UIViewController.

import UIKit

//Model Class - Define Data Structure
struct Item {
    let id: Int
    let name: String
}

//ViewModel Class
class ViewModel {
    
    private(set) var items: [Item] = []
    
    func fetchItems(completion: @escaping () -> Void) {
        items = [
            Item(id: 1, name: "Item 1"),
            Item(id: 2, name: "Item 2")
        ]
        completion()
    }
}

//View Class
class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpTableView()
        viewModel.fetchItems {
            self.tableView.reloadData()
        }
    }
    
    func setUpTableView() {
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = self.viewModel.items[indexPath.row].name
        return cell
    }
}


