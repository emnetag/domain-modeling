//
//  main.swift
//  DomainModeling
//
//  Created by user on 10/14/15.
//  Copyright © 2015 user. All rights reserved.
//

import Foundation

print("Hello, World!")

struct Money {
    var amount : Int = 0
    
    enum CurrencyType {
        case GBP
        case USD
        case CAN
        case EUR
    }
    
    mutating func add(amount a: Int) -> Void {
        self.amount += a
    }
    
    mutating func subtract(amount a: Int) -> Void {
        self.amount -= a
    }
    
    var currency = CurrencyType.USD
    
    
}

