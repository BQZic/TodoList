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
    var tasks : [oneTask]
    var schedule : [oneSchedule]
    var deleted : [oneDeleted]
    
    //a standard initializer
    init(of id:String){
        if id=="" {print("Empty Name Error")}
        self.id = id
        tasks = []
        schedule = []
        deleted = []
    }
    
    //a basic initializer
    init() {
        self.id = ""
        tasks = []
        schedule = []
        deleted = []
    }
    
    //add an oneTask to tasks when id is not "Nil"
    func addTask(title:String,detail:String,count:Int) {
        if id == "" { return }
        tasks.append(oneTask(title: title, detail: detail, count: count))
        print(tasks)
    }
    
}
