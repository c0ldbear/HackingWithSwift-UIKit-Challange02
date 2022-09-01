//
//  ViewController.swift
//  Challange02
//
//  Created by teddy on 2022-09-01.
//

import UIKit

class TableViewController: UITableViewController {

    var items = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if items.isEmpty {
            items = ["potato", "apple", "milk", "heavy cream", "tofu"]
        }
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        var cellContent = cell.defaultContentConfiguration()
        cellContent.text = items[indexPath.row].capitalized
        cell.contentConfiguration = cellContent
        return cell
    }

}

