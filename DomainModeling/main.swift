//
//  main.swift
//  DomainModeling
//
//  Created by user on 10/14/15.
//  Copyright © 2015 user. All rights reserved.
//

import Foundation


enum Currency {
    case GBP
    case USD
    case CAN
    case EUR
}

struct Money {
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
}

print("Money Test cases ")
var wallet = Money(amount: 20, currency: Currency.USD)

print("Created Money in \(wallet.currency) with \(wallet.getTotal()) in it.\n")

wallet.add(amount: 50, currency: Currency.EUR)
print("Added 50 Euros, now my wallet has \(wallet.getTotal()) in dollars.\n")

wallet.add(amount: 10, currency: Currency.GBP)
print("Added 10 Pounds, now my wallet has \(wallet.getTotal()) in dollars.\n")

wallet.add(amount: 9, currency: Currency.CAN)
print("Added 9 Canadian dollars, now has \(wallet.getTotal()) in dollars.\n")

wallet.convert(type: .EUR)
print("In Euros, that is \(wallet.getTotal()) Euros.\n")

wallet.convert(type: .USD)
print("I still have \(wallet.getTotal()) US Dollars.\n")

wallet.convert(type: .CAN)
print("In Canadian dollars, I have \(wallet.getTotal()) dollars.\n")















