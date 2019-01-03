//
//  todoList.swift
//  TodoList
//
//  Created by Haoyun Zhu on 2019/1/3.
//  Copyright © 2019 Haoyun Zhu. All rights reserved.
//

import Foundation

enum initializationError : Error{
    case emptyNameError
}

class todoListModel{
    private var id : String
    var tasks = tasksModel()
    var schedule = scheduleModel()
    var deleted = deletedModel()
    
    //a standard initializer
    init(of id:String){
        if id=="" {print("Empty Name Error")}
        self.id = id
    }
    
    //a basic initializer
    init() {
        self.id = ""
    }
    
    //add an oneTask to tasks when id is not "Nil"
    func addTask(title:String,detail:String,count:Int) {
        if id == "" { return }
        tasks.addTask(title: title, detail: detail, count: count)
    }
    
}
