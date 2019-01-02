//
//  MainViewController.swift
//  TodoList
//
//  Created by Haoyun Zhu on 2019/1/2.
//  Copyright © 2019 Haoyun Zhu. All rights reserved.
//

import UIKit

class MainViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBOutlet weak var pageTitle: UILabel!
    var pageNames = ["Schedule","Tasks","Deleted"]
    @IBAction func addTask(_ sender: UIButton) {
        pageController.addTask()
    }
    
    //this is the ptr to the pageVC inside the container
    var pageController = mainPageController()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "containerSegue"{
            if let destinationVC = segue.destination as? mainPageController{
                pageController = destinationVC
                pageController.buttomLabel = pageTitle
            }

        }
    }
    
   

    
}
