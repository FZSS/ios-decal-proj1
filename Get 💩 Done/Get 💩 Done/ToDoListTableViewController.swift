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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let timer = NSTimer.scheduledTimerWithTimeInterval(50.0, target: self, selector: "clearExpiredTasks", userInfo: nil, repeats: true)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TodoCell", forIndexPath: indexPath) as! TableViewCell
    
        cell.todoItemTextLabel.text = tasks[indexPath.row].getText()
        
        if tasks[indexPath.row].finished == true {
            cell.accessoryType = .Checkmark
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == .Delete) {
            self.tasks.removeAtIndex(indexPath.row)
            self.tableView.reloadData()
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if cell?.accessoryType == .Checkmark {
            cell?.accessoryType = .None
            tasks[indexPath.row].finished = false
            
        } else {
            cell?.accessoryType = .Checkmark
            tasks[indexPath.row].markComplete()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toStats" {
            let viewController = segue.destinationViewController as! StatsViewController
            var finishedNum = 0;
            for index in 0...tasks.count - 1 {
                if tasks[index].isFinished() {
                    finishedNum += 1
                }
            }
            viewController.taskFinishedLast24Hours = finishedNum
        }
    }

    
    @IBAction func unwindToDoListTableViewController(segue:UIStoryboardSegue) {
    }
    
    @IBAction func unwindToDoListTableViewControllerAndSaveNotes(segue:UIStoryboardSegue) {
    }
    
    func clearExpiredTasks() {
        if (tasks.count > 0) {
            for index in 0...tasks.count - 1 {
                if tasks[index].shouldClear() {
                    tasks.removeAtIndex(index)
                }
            }
        }
    }
}

