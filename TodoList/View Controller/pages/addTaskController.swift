//
//  addTaskController.swift
//  TodoList
//
//  Created by Beiqi Zou on 1/8/19.
//  Copyright © 2019 Haoyun Zhu. All rights reserved.
//

import UIKit

class addTaskController: UIViewController, UITextFieldDelegate, UITextViewDelegate{
    
    var mainVC: mainPageController?
    @IBOutlet weak var itemTitle: UITextField!
    @IBOutlet weak var itemContent: UITextView!
    
    
    @IBAction func backPage(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addTask(_ sender: UIBarButtonItem) {
        mainVC?.addTask(title: itemTitle.text!, content: itemContent.text!)
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTitle.delegate = self
        itemContent.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        itemTitle.resignFirstResponder()
        return true
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        itemContent.resignFirstResponder()
        return true
    }


}
