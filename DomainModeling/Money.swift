//
//  Money.swift
//  DomainModeling
//
//  Created by user on 10/20/15.
//  Copyright © 2015 user. All rights reserved.
//

import Foundation

struct Money: CustomStringConvertible, Mathematics {
    var amount : Double  // internally stored as USD
    var currency : Currency
    
    init(amount: Double, currency: Currency) {
        self.amount = amount
        self.currency = currency
    }
    
    mutating func add(amount a: Double, currency c: Currency) -> Void {
        // first convert to USD
        let newAmount = converToDollar(a, currency: c)
        self.amount += newAmount
    }
    
    mutating func subtract(amount a: Double, currency c: Currency ) -> Void {
        let newAmount = converToDollar(a, currency: c)
        self.amount -= newAmount
    }
    
    
    mutating func getTotal() -> Double {
        switch self.currency {
        case .CAN:
            return round(100 * (self.amount * 1.25)) / 100
        case .GBP:
            return round(100 * (self.amount * 0.5)) / 100
        case .EUR:
            return round(100 * (self.amount * 1.5)) / 100
        default:
            return round(100 * self.amount) / 100
        }
    }
    
    mutating func convert(type t: Currency) {
        self.currency = t
    }
    
    private func converToDollar(sum: Double, currency: Currency) -> Double {
        switch currency {
        case .CAN:
            return sum * 0.8
        case .GBP:
            return sum * 2.0
        case .EUR:
            return sum * (2.0 / 3.0)
        default: return sum
        }
    }
    
    //domain-modeling part 2
    var description: String {return "\(self.currency)\(self.amount)"}
    
    func addition(var left: Money, right: Money) -> Money {
        if left.currency != right.currency {
            left.currency = right.currency
        }
        return Money(amount: (left.amount + right.amount), currency: left.currency)
    }
    
    func subtraction(var left: Money, right: Money) -> Money {
        if left.currency != right.currency {
            left.currency = right.currency
        }
        return Money(amount: (left.amount - right.amount), currency: left.currency)
    }
}