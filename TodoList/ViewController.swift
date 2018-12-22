//
//  ViewController.swift
//  TodoList
//
//  Created by Beiqi Zou on 12/21/18.
//  Copyright © 2018 Beiqi Zou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var test1: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        test1.placeholder = "Todo 1"
        test1.clearButtonMode = .whileEditing
        
        generateTextField(2)
    }
    
    func generateTextField(_ number: Int){
        for i in 2...number{
            let textField = UITextField(frame: CGRect(x:10, y:60, width:200, height:30))
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.placeholder = "Todo " + String(i)
            self.view.addSubview(textField)
        }
    }


}

