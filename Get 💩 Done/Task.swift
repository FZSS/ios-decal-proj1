//
//  Task.swift
//  Get 💩 Done
//
//  Created by Fangzhou Chen on 3/1/16.
//  Copyright © 2016 Kevin Fangzhou Chen. All rights reserved.
//
import Foundation

class Task {
    
    private var content : String
    private var completeDate : NSDate?
    var finished : Bool
    
    init(content : String) {
        self.content = content
        self.finished = false
    }

    func markComplete() {
        self.finished = true
        self.completeDate = NSDate()
    }
    
    func isFinished() -> Bool{
        return finished
    }
    
    func shouldClear() -> Bool {
        if (finished == true) {
            let currentDate = NSDate()
            let elapsedCompleteDate = self.completeDate!.dateByAddingTimeInterval((60*60*24))
            if (elapsedCompleteDate.earlierDate(currentDate) == currentDate) {
                return true
            }
        }
        return false
    }
    
    func getText() -> String {
            return self.content
    }
    
    
    
}