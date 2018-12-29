//
//  TodoItem.swift
//  TodoList
//
//  Created by Beiqi Zou on 12/28/18.
//  Copyright © 2018 Beiqi Zou. All rights reserved.
//

import Foundation

class TodoItem {
    var id: Int
    var title: String           // task 1,2,3...
    var content: String
    
    // var category ??
    // var time ??
    
    init(id: Int, title: String, content: String){
        self.id = id
        self.title = title
        self.content = content
    }
}


