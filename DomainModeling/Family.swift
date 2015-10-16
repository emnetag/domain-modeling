//
//  Family.swift
//  DomainModeling
//
//  Created by user on 10/15/15.
//  Copyright © 2015 user. All rights reserved.
//

import Foundation

class Family {
    var fam : [Person]
    
    init(fam: [Person]) {
        self.fam = fam
    }
    
    func householdIncome() -> Double? {
        var total : Double = 0
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
        
        for person in fam {
            if (person.age > 21) {
                fam.append(kid)
                break
            }
        }
    }
}