//
//  Person.swift
//  DomainModeling
//
//  Created by user on 10/15/15.
//  Copyright © 2015 user. All rights reserved.
//

import Foundation

class Person {
    var firstName : String
    var lastName : String
    
    var job : Job?
    
    var age : Int
    
    var spouse : Person?
    
    init(first : String, last: String, age: Int) {
        self.firstName = first
        self.lastName  = last
        self.age = age
    }
    
    func toString() -> String {
        return "\(self.firstName) \(self.lastName)"
    }
    
    func getMarried(spouse s: Person) -> Void {
        if (s.age >= 18 && self.age >= 18) {
            self.spouse = s
            s.spouse = self
        } else {
            print("Cannot get married if under the age of 18")
        }
    }
    
    func getAJob(job j: Job) {
        if (self.age >= 16) {
            self.job = j
        } else {
            print("You need to be at least 16 years old to get a job")
        }
    }
}