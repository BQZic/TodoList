//
//  MainViewController.swift
//  TodoList
//
//  Created by Haoyun Zhu on 2019/1/2.
//  Copyright © 2019 Haoyun Zhu. All rights reserved.
//

import UIKit

class mainViewController: UIViewController{
    
    //load view
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //this is the ptr to the pageVC inside the container
    var pageController = mainPageController()
    
    var taskController = addTaskController()
    
    var pageNames = ["Schedule","Tasks","Deleted"]
    
    //bottom bar outlets
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var bottomLeftButton: UIButton!
    @IBOutlet weak var bottomRightButton: UIButton!
    
    //bottom right button
    @IBAction func onTapBottomRightButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "AddTaskSegue", sender: self)
        //pageController.onTapBottomRightButton()
    }
    @IBAction func onTapBottomLeftButton(_ sender: UIButton) {
        pageController.onTapBottomLeftButton()
    }
    
    //prepare for the segue: pass the model and link the ptrs
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "containerSegue"{
            if let destinationVC = segue.destination as? mainPageController{
                pageController = destinationVC
                pageController.pageNames = pageNames
                pageController.bottomLabel = bottomLabel
                pageController.bottomLeftButton = bottomLeftButton
                pageController.bottomRightButton = bottomRightButton
                
            }
        }
        
        if segue.identifier == "AddTaskSegue" {
            if let destinationVC = segue.destination as? addTaskController {
                taskController = destinationVC
                taskController.mainVC = pageController
                taskController.backPageName = bottomLabel.text
            }
        }
    }
    
   

    
}
