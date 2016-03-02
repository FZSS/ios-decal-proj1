//
//  AddItemViewController.swift
//  Get 💩 Done
//
//  Created by Fangzhou Chen on 3/1/16.
//  Copyright © 2016 Kevin Fangzhou Chen. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    @IBOutlet weak var itemTextInput: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "unwindAndAddNotes") {
            let viewController = segue.destinationViewController as! ToDoListTableViewController
            let newTask : Task = Task(content: itemTextInput.text!)
            viewController.tasks.append(newTask)
            viewController.tableView.reloadData()
        }
    }
    


}
