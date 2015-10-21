//
//  Job.swift
//  DomainModeling
//
//  Created by user on 10/20/15.
//  Copyright © 2015 user. All rights reserved.
//

import Foundation

/*
* Person class
*/
class Person: CustomStringConvertible {
    var firstName : String
    var lastName : String
    var job : Job?
    var age : Int
    weak var spouse : Person?
    
    init(first : String, last: String, age: Int, job: Job? = nil, spouse: Person? = nil) {
        self.firstName = first
        self.lastName  = last
        self.age = age
        
        // Cannot get married before age 18
        if age < 18 {
            self.spouse = nil
        } else {
            self.spouse = spouse
        }
        
        // Cannot have a job before age 16
        if age < 16 {
            self.job = nil
        } else {
            self.job = job
        }
        
    }
    
    func toString() -> String {
        let position = self.job != nil ? self.job!.title : "unemployed"
        let spouseInfo = self.spouse != nil ? "\(self.spouse!.firstName) \(self.spouse!.lastName)" : "not married"
        let salary = self.job != nil ? self.job!.calculateIncome() : 0.0
        return "\(self.firstName) \(self.lastName)\nAge: \(self.age) years\nSalary: \(salary) \nJob: \(position)\nSpouse: \(spouseInfo)"
    }
    
    //domain-modeling part 2
    var description : String { return toString() }
}