//
//  scheduleController.swift
//  TodoList
//
//  Created by Haoyun Zhu on 2018/12/30.
//  Copyright © 2018 Haoyun Zhu. All rights reserved.
//

import UIKit

class scheduleController: UITableViewController {

    var tableID = "Schedule Cell"
    var schedule = scheduleModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedule.schedule.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableID, for: indexPath)
        let index = indexPath.row
        if index>=0 && index<schedule.schedule.count{
        let tempCell = schedule.schedule[index]
        cell.textLabel?.text = tempCell.title
        cell.detailTextLabel?.text = tempCell.detail
        }
        return cell
    }
}
