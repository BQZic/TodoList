//
//  mainPageController.swift
//  TodoList
//
//  Created by Haoyun Zhu on 2018/12/30.
//  Copyright © 2018 Haoyun Zhu. All rights reserved.
//

import UIKit

class mainPageController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    //label and buttons on the bottom(theses are ptrs to a UILabel in MainViewController)
    var bottomLabel = UILabel()
    var bottomLeftButton = UIButton()
    var bottomRightButton = UIButton()
    var bottomLeftText = ["Edit","Edit","Edit"]{
        didSet{
            if didSetBottomButtons(array: bottomLeftText, oldValue: oldValue,position: "left"){
                bottomLeftButton.setTitle(bottomLeftText[currentIndex], for: UIControl.State.normal)
            }
        }
    }
    var bottomRightText = ["Add","Add","Add"]{
        didSet{
            if didSetBottomButtons(array: bottomRightText, oldValue: oldValue,position: "right"){
                bottomRightButton.setTitle(bottomRightText[currentIndex], for: UIControl.State.normal)
            }
        }
    }
    
    //this function detect which index of an array is changed
    func didSetBottomButtons (array: Array<String>,oldValue : Array<String>,position: String) ->Bool{
        let changedIndexes = zip(array, oldValue).map{$0 != $1}.enumerated().filter{$1}.map{$0.0}
        if changedIndexes != [currentIndex] {
            print("error: changing text of index \(changedIndexes) on the \(position).")
            return false
        }
        return true
    }
    

    //generate a list of UIViewController to scroll through
    func newViewController(viewControllerID:String) -> UIViewController{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewControllerID)
    }
    //DO NOT CHANGE THE ID, it links to the storyboard
    lazy var pages : [UIViewController] =
        [newViewController(viewControllerID: "Schedule Controller"),
         newViewController(viewControllerID: "Tasks Controller"),
         newViewController(viewControllerID: "Deleted Controller")]
    
    //button titles, pre set in MainViewController
    var pageNames = [String]()
    
    //current page index, after set to an index, change the name of bottom title
    var currentIndex = 0{
        didSet{
            bottomLabel.text = pageNames[currentIndex]
            bottomLeftButton.setTitle(bottomLeftText[currentIndex], for: UIControl.State.normal)
            bottomRightButton.setTitle(bottomRightText[currentIndex], for: UIControl.State.normal)
        }
    }
    
    func onTapBottomRightButton(){
        //if bottomRightText[currentIndex] == "Add" {addTask()}
    }
    
    func onTapBottomLeftButton(){
       if bottomLeftText[currentIndex] == "Edit" || bottomLeftText[currentIndex] == "Done" {changeIsEditting()}
    }
    
    //add a task to tasks table and set currentIndex to 1
    /*
    func addTask(){
        //If not at page: tasks, goto page: tasks
        if currentIndex != 1 {goto(pageIndex: 1)}
        if let taskVC = viewControllers![0] as? tasksController{
            taskVC.addTask(title: "new T", detail: "new D", count: 1)
        }
    }*/
    
    func addTask(title: String, content: String){
        if currentIndex != 1 {goto(pageIndex: 1)}
        if let taskVC = viewControllers![0] as? tasksController{
            taskVC.addTask(title: title, detail: content, count: 1)
        }
    }
    
    //change editting mode for tables
    func changeIsEditting(){
        if let tableVC = viewControllers![0] as? UITableViewController{
            tableVC.isEditing = !tableVC.isEditing
            bottomLeftText[currentIndex] = tableVC.isEditing ? "Done" : "Edit"
        }
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
    
    //reload table every time before switching to it
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let tableVC =  pendingViewControllers[0] as? UITableViewController{
            tableVC.tableView.reloadData()
        }
    }
    
    //goto a page(set current view to a page)
    func goto(pageIndex index:Int){
        if index>=0 && index<pages.count{
            //goto the first page of pages
            setViewControllers([pages[index]],direction: .forward,animated: true,completion: nil)
            currentIndex = index
        }
    }
    
    //load view
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        
        //goto page 0
        goto(pageIndex: 0)
        
        
    }
   
   
}
