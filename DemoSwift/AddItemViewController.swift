//
//  AddItemViewController.swift
//  DemoSwift
//
//  Created by Jay on 21/03/16.
//  Copyright © 2016 Jay. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate
{
    func controller(controller: AddItemViewController, didAddItem: String)
}



class AddItemViewController: UIViewController {
    
    var delegate:AddItemViewControllerDelegate?
    @IBOutlet weak var txtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCreateClick(sender: AnyObject)
    {
        if let textEntered=txtField.text
        {
            if textEntered.characters.count>0
            {
                delegate?.controller(self, didAddItem:textEntered)
            }
            else
            {
                txtField.placeholder="hey we need some input here!!"
            }
        }
        
    }
    
    @IBAction func onCancelClick(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
