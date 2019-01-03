//
//  mainPageController.swift
//  TodoList
//
//  Created by Haoyun Zhu on 2018/12/30.
//  Copyright © 2018 Haoyun Zhu. All rights reserved.
//

import UIKit

class mainPageController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    //label on the bottom(this is a ptr to a UILabel in MainViewController)
    var buttomLabel = UILabel()
    //generate a list of UIViewController to scroll through
    func newViewController(vcName:String) -> UIViewController{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: vcName)
    }
    lazy var pages : [UIViewController] = [newViewController(vcName: "Schedule Controller"),
                                                newViewController(vcName: "Tasks Controller"),
                                                newViewController(vcName: "Deleted Controller")]
    //get names with index
    var pageNames = ["Schedule","Tasks","Deleted"]
    var currentIndex = 0{
        didSet{
            buttomLabel.text = pageNames[currentIndex]
        }
    }
    
    //add a task to tasks table and set currentIndex to 1
    func addTask(){
        //If not at page: tasks, goto page: tasks
        if currentIndex != 1 {goto(pageIndex: 1)}
        print("add!!!")
    }
    
    //get the previous page(swipe right)
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.index(of:viewController as! UITableViewController) else{return nil}
        let previousIndex = currentIndex - 1
        
        guard previousIndex >= 0 else{return pages.last}
        
        guard pages.count > previousIndex else{return nil}
        
        return pages[previousIndex]
    }
    
    //get the next page(swipe left)
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.index(of:viewController as! UITableViewController) else{return nil}
        let nextIndex = currentIndex + 1
        
        guard pages.count != nextIndex else{return pages.first}
        
        guard pages.count > nextIndex else{return nil}
        
        return pages[nextIndex]
    }
    
    //when did finish, change the title of navigation bar
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        currentIndex = pages.index(of: pageContentViewController)!
    }
    
    //goto a page(set current view to a page)
    func goto(pageIndex index:Int){
        if index>=0 && index<pages.count{
            //goto the first page of pages
            setViewControllers([pages[index]],direction: .forward,animated: true,completion: nil)
            currentIndex = index
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        
        //goto page 0
        goto(pageIndex: 0)
        
        
    }
   
   
}
