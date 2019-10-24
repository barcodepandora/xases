//
//  MasterViewController.swift
//  XAses
//
//  Created by Juan Manuel Moreno on 24/10/2019.
//  Copyright © 2019 Juan Manuel Moreno. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController, ViewModelDelegate {

    // MARK: - Character
    
    var viewModel: MasterViewModel?
    var detailViewController: DetailViewController? = nil
    var objects = [Any]()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = editButtonItem

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        navigationItem.rightBarButtonItem = addButton
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        var product = Product(name: "iPhone", desc: "iPhone XR", cost: 1000, image: "https://www.project-imas.com/w/images/e/e4/Takane_Arcade1.jpg")
//        product.name =
//        product.desc = "iPhone XR"
//        product.cost = 1000
//        product.image = "https://www.project-imas.com/w/images/e/e4/Takane_Arcade1.jpg"
//        SQLiteManager.shared.addProduct(product)
        print("All = \(SQLiteManager.shared.getAllProduct())")
        
        viewModel = MasterViewModelOffline()
        viewModel!.delegate = self
        viewModel!.getAllProduct()
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    @objc
    func insertNewObject(_ sender: Any) {
        objects.insert(NSDate(), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = self.viewModel!.products![indexPath.row] as! Product
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
//                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                detailViewController = controller
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel!.products!.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MasterCell", for: indexPath)
        let object = self.viewModel!.products![indexPath.row] as! Product
        cell.textLabel!.text = object.desc
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }

    // MARK: - View Model Delegate
       
    func refresh() {
//        self.reloadData()
        self.tableView.reloadData()
    }

}

