//
//  Job.swift
//  DomainModeling
//
//  Created by user on 10/15/15.
//  Copyright © 2015 user. All rights reserved.
//

import Foundation

class Job {
    
    var title : String
    
    var salary : Double
    
    var hourly : Bool
    
    init(jobTitle : String, jobSalary : Double, hourly: Bool) {
        self.title = jobTitle
        self.salary = jobSalary
        self.hourly = hourly
    }
    
    func calculateIncome(hours h : Double) -> Double {
        if (hourly) {
            return salary * h
        } else {
            return salary
        }
    }
    
    func raise(rate r: Int) -> Void {
        let percentage = Double(r / 100)
        self.salary += (self.salary * percentage)
    }
}