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
        
        title = "🛒 Shopping List"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAddItem))
        
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
    
    @objc func promptForAddItem() {
        let ac = UIAlertController(title: "Add item", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] action in // we declare them as being weak so that Swift won’t create a strong reference cycle.
            guard let answer = ac?.textFields?[0].text else { return }
            self?.submit(answer)
        }
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func submit(_ answer: String) {
        let indexPath = IndexPath(row: 0, section: 0)
        items.insert(answer.capitalized, at: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }

}

