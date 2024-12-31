//
//  ViewController.swift
//  MVP
//
//  Created by Sangeeta on 30/12/24.
//

import UIKit

//Model
struct Item {
    let id: Int
    let name: String
}

//View

protocol ItemViewProtocol: AnyObject {
    func showItems(_ items: [Item])
}

class ViewController: UIViewController, ItemViewProtocol, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private var items: [Item] = []
    let presenter = ItemPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpTableView()
        presenter.view = self
        presenter.fetchItems()
    }

    func showItems(_ items: [Item]) {
        self.items = items
        self.tableView.reloadData()
    }
    
    func setUpTableView() {
        self.tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = self.items[indexPath.row].name
        return cell
    }
}

//Presenter
class ItemPresenter {
    
    weak var view: ItemViewProtocol?
    
    func fetchItems() {
        //Mock API call
        let items = [
            Item(id: 1, name:"Item 1"),
            Item(id: 2, name: "Item 2")
        ]
        view?.showItems(items)
    }
}
