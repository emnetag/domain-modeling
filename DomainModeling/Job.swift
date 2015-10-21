//
//  Job.swift
//  DomainModeling
//
//  Created by user on 10/20/15.
//  Copyright © 2015 user. All rights reserved.
//

import Foundation

/*
* JOB class
*/
class Job: CustomStringConvertible {
    
    var title : String
    
    var salary : Double
    
    var hourly : Bool
    
    init(jobTitle : String, jobSalary : Double, hourly: Bool) {
        self.title = jobTitle
        self.salary = jobSalary
        self.hourly = hourly
    }
    
    func calculateIncome(hours h : Double = 0.0) -> Double {
        if (hourly) {
            return self.salary * h
        } else {
            return self.salary
        }
    }
    
    func raise(percentage: Double) -> Void {
        self.salary *= 1 + (percentage / 100)
    }
    
    //domain-modeling part 2
    var description: String { return "Title: \(self.title)\nSalary: \(self.salary)\nHourly: \(self.hourly)" }
    
}