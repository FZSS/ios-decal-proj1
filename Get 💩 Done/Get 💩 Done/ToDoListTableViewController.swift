//
//  ViewController.swift
//  Get 💩 Done
//
//  Created by Fangzhou Chen on 3/1/16.
//  Copyright © 2016 Kevin Fangzhou Chen. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    
    var tasks:[Task] = []
    let model = ["eat", "poop"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TodoCell", forIndexPath: indexPath) as! TableViewCell
    
        cell.todoItemTextLabel.text = model[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    @IBAction func unwindToDoListTableViewController(segue:UIStoryboardSegue) {
    }


}

