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
    struct tempCell {
        var title = "Tasks Cell Temp"
        var content = "subsubsub"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableID, for: indexPath)
        cell.textLabel?.text = tempCell().title
        cell.detailTextLabel?.text = tempCell().content
        
        return cell
    }
}
