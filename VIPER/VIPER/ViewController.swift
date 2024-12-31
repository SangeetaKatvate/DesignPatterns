//
//  ViewController.swift
//  VIPER
//
//  Created by Sangeeta on 30/12/24.
//

import UIKit

//Entity
struct Item {
    let id: Int
    let name: String
}

//Interactor
protocol ItemInteractorInput {
    func fetchItems()
}

protocol ItemInteractorOutput: AnyObject {
    func didFetchItems(_ items: [Item])
}

class ItemInteractor: ItemInteractorInput {
    
    weak var output: ItemInteractorOutput?
    
    func fetchItems() {
        let items = [
            Item(id: 1, name: "Item 1"),
            Item(id: 2, name: "Item 2")
        ]
        output?.didFetchItems(items)
    }
}

//Presenter
protocol ItemViewProtocol: AnyObject {
    func showItems(_ items: [Item])
}

class ItemPresenter {
    
    weak var view: ItemViewProtocol?
    var interactor: ItemInteractorInput?
    
    func viewDidLoad() {
        interactor?.fetchItems()
    }
}

extension ItemPresenter: ItemInteractorOutput {
    func didFetchItems(_ items: [Item]) {
        view?.showItems(items)
    }
}

//View
class ViewController: UIViewController, UITableViewDataSource, ItemViewProtocol {

    @IBOutlet var tableView: UITableView!
    private var items: [Item] = []
    
    let presenter = ItemPresenter()              // Concrete Presenter instance
    let interactor = ItemInteractor()            // Concrete Interactor instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpTableView()
        
        presenter.view = self              // Assign concrete View to protocol-typed property
        presenter.interactor = interactor  // Assign concrete Interactor to protocol-typed property
        interactor.output = presenter      // Assign concrete Presenter to protocol-typed delegate
        presenter.viewDidLoad()
    }
    
    func setUpTableView() {
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = self.items[indexPath.row].name
        return cell
    }

    func showItems(_ items: [Item]) {
        self.items = items
        self.tableView.reloadData()
    }
}

//Router
class ItemRouter {
    
    static func createModule() {

    }
}



