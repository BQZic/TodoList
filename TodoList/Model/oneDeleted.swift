//
//  oneDeleted.swift
//  TodoList
//
//  Created by Haoyun Zhu on 2019/1/3.
//  Copyright © 2019 Haoyun Zhu. All rights reserved.
//

import Foundation

class oneDeleted{
    var title:String
    var detail:String
    var count:Int
    
    init(title:String,detail:String,count:Int) {
        self.title = title
        self.detail = detail
        self.count = count
    }
    
    func copy() -> oneDeleted{
        return oneDeleted(title: title, detail: detail, count: count)
    }
}
