//
//  ViewController.swift
//  TodoList
//
//  Created by Beiqi Zou on 12/21/18.
//  Copyright © 2018 Beiqi Zou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func addNewItem(_ sender: Any, forEvent event: UIEvent) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func keyBoardWillHide(note:NSNotification)
    {
        let userInfo  = note.userInfo as! NSDictionary
        let duration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        let animations:(() -> Void) = {
            self.keyBaordView.transform = CGAffineTransformIdentity
        }
        
        if duration > 0 {
            let options = UIView.AnimationOptions(UInt((userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).integerValue << 16))
            
            UIView.animateWithDuration(duration, delay: 0, options:options, animations: animations, completion: nil)
        }else{
            animations()
        }
    }
}

