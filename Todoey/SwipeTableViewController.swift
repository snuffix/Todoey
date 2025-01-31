//
//  SwipeTableViewController.swift
//  Todoey
//
//  Created by Adrian Kremski on 02/10/2019.
//  Copyright © 2019 Adrian Kremski. All rights reserved.
//

import UIKit
import SwipeCellKit

class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80.0
        tableView.separatorColor = .white
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SwipeTableViewCell
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            self.deleteCell(cellNumber: indexPath.row)
            self.tableView.reloadData()
        }
        
        // customize the action appearance
        deleteAction.image = UIImage(named: "deleteIcon")
        
        return [deleteAction]
    }
    
    func deleteCell(cellNumber: Int) {
        
    }
}
