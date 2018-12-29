//
//  TodoItemViewController.swift
//  TodoList
//
//  Created by Beiqi Zou on 12/29/18.
//  Copyright © 2018 Beiqi Zou. All rights reserved.
//

import UIKit

class TodoItemViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var content: UITextView!
    
    @IBOutlet weak var itemTitle: UITextField!
    
    var item: TodoItem?
    override func viewDidLoad() {
        super.viewDidLoad()
        if item != nil{
            itemTitle.text = item?.title
            content.text = item?.content
        }
        
        itemTitle.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        itemTitle.resignFirstResponder()
        return true
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
