//
//  ViewController.swift
//  DemoSwift
//
//  Created by Jay on 21/03/16.
//  Copyright © 2016 Jay. All rights reserved.
//

import UIKit

class ViewController: UIViewController,AddItemViewControllerDelegate,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tblList: UITableView!
    @IBOutlet weak var lblStartText: UILabel!
    var tableData=[String]()
    
    override func viewDidLoad() {
        
        tblList.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.title="Notes"
        tblList.hidden=true
        tblList.tableFooterView = UIView(frame: CGRectZero)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AddItemViewController" {
            let navigationController = segue.destinationViewController as? UINavigationController
            let addItemViewController = navigationController?.topViewController as? AddItemViewController
            
            if let viewController = addItemViewController {
                viewController.delegate = self
            }
        }
    }
    
    func controller(controller: AddItemViewController, didAddItem: String)
    {
        tableData.append(didAddItem)
        tblList.reloadData()
        tblList.hidden=false
        tblList.backgroundColor=UIColor(red:169.0/255.0, green: 200.0/255.0, blue:240.0/255.0, alpha: 1.0)
        lblStartText.hidden=true
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if cell.respondsToSelector(Selector("setPreservesSuperviewLayoutMargins:"))
        {
            cell.preservesSuperviewLayoutMargins=false
        }
        
        if cell.respondsToSelector(Selector("setLayoutMargins:"))
        {
            cell.layoutMargins=UIEdgeInsetsZero
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text=tableData[indexPath.row]
        cell.backgroundColor=UIColor(red:169.0/255.0, green: 200.0/255.0, blue:240.0/255.0, alpha: 1.0)
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.Delete
        {
            tableData.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            if tableData.count<=0
            {
                tblList.hidden=true
                lblStartText.hidden=false
            }
        }
    }
    
}

