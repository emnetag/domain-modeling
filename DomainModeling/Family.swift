//
//  Family.swift
//  DomainModeling
//
//  Created by user on 10/20/15.
//  Copyright © 2015 user. All rights reserved.
//

import Foundation

/*
* Family Class
*/
class famClass: CustomStringConvertible {
    var fam : [Person] = []
    
    init?(fam: [Person]) {
        for person in fam {
            if person.age > 21 {
                self.fam = fam
                return
            }
        }
        return nil
    }
    
    func householdIncome() -> Double {
        var total : Double = 0.0
        for person in self.fam {
            if let employed = person.job {
                if (employed.hourly) {
                    total += employed.calculateIncome(hours: 2000)
                } else {
                    total += employed.salary
                }
            }
        }
        return total
    }
    
    func haveChild(first f: String, last l: String) -> Void {
        let kid = Person(first: f, last: l, age: 0)
        self.fam.append(kid)
    }
    
    //domain-modeling part 2
    var description: String { return "Family Name: \(self.fam[0].lastName)\nIncome: \(self.householdIncome())" }
}