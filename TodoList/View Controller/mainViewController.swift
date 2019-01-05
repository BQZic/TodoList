//
//  MainViewController.swift
//  TodoList
//
//  Created by Haoyun Zhu on 2019/1/2.
//  Copyright © 2019 Haoyun Zhu. All rights reserved.
//

import UIKit

class mainViewController: UIViewController{
    
    //this is the ptr to the pageVC inside the container
    var pageController = mainPageController()
    
    //load view
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //bottom title
    @IBOutlet weak var pageTitle: UILabel!
    
    //addTask function
    @IBAction func addTask(_ sender: UIButton) {
        pageController.addTask()
    }
    
    @IBAction func edit(_ sender: UIButton) {
        if let isEditting = pageController.setIsEditting(){
            if isEditting{
                sender.setTitle("Done", for: UIControl.State.normal)
            }else{
                sender.setTitle("Edit", for: UIControl.State.normal)
            }
        }
    }
    
    
    //prepare for the segue: pass the model and link the ptrs
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "containerSegue"{
            if let destinationVC = segue.destination as? mainPageController{
                pageController = destinationVC
                pageController.bottomLabel = pageTitle
            }
        }
    }
    
   

    
}
