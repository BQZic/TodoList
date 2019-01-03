//
//  tasksModel.swift
//  TodoList
//
//  Created by Haoyun Zhu on 2019/1/3.
//  Copyright © 2019 Haoyun Zhu. All rights reserved.
//

import Foundation
class tasksModel{
    var tasks = [oneTask]()
    
    func addTask(title:String,detail:String,count:Int){
        tasks.append(oneTask(title: title, detail: detail, count: count))
    }
}
