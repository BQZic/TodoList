//
//  tasksController.swift
//  TodoList
//
//  Created by Haoyun Zhu on 2018/12/30.
//  Copyright © 2018 Haoyun Zhu. All rights reserved.
//

import UIKit

class tasksController: UITableViewController {
    
    var tableID = "Tasks Cell"
    var tasks = tasksModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.tasks.count
    }

    //load
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableID, for: indexPath)
        let index = indexPath.row
        if index>=0 && index<tasks.tasks.count{
        let tempCell = tasks.tasks[index]
        cell.textLabel?.text = tempCell.title
        cell.detailTextLabel?.text = tempCell.detail
        }
        return cell
    }
    
    //delete
    
//    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//
//        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
//            // delete item at indexPath
//            self.tasks.tasks.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//
//        return [delete]
//    }
    
    //add a cell
    var count = 0
    func addTask(title: String, detail: String, count: Int){
        self.count += 1
        tasks.addTask(title: title, detail: String(self.count), count: self.count)
        tableView.reloadData()
    }
    
    //move table cells
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let cellToMove = tasks.tasks[sourceIndexPath.row]
        tasks.tasks.remove(at: sourceIndexPath.row)
        tasks.tasks.insert(cellToMove, at: destinationIndexPath.row)
    }
    
}
