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
    var amount : Double = 0
    
    enum Currency {
        case GBP
        case USD
        case CAN
        case EUR
    }
    
    mutating func add(amount a: Double, currency c: Currency) -> Void {
        if (self.currency != c) {
            convert(type: c)
        }
        self.amount += a
    }
    
    mutating func subtract(amount a: Double, currency c: Currency ) -> Void {
        if (self.currency != c) {
            convert(type: c)
        }
        self.amount -= a
    }
    
    var currency = Currency.USD
    
    mutating func convert(type t: Currency) -> Void {
        switch self.currency {
            case .USD:
                switch t {
                    case .GBP:
                        self.amount *= 0.5
                    case .CAN:
                        self.amount *= 1.25
                    case .EUR:
                        self.amount *= 1.5
                    case .USD:
                        return
                }
            case .GBP:
                switch t {
                    case .GBP:
                        return
                    case .CAN:
                        self.amount *= 2.5
                    case .EUR:
                        self.amount *= 3
                    case .USD:
                        self.amount *= 2
                }
            case .EUR:
                switch t {
                    case .GBP:
                        self.amount *= 0.33
                    case .CAN:
                        self.amount *= 0.83
                    case .USD:
                        self.amount *= 0.667
                    case .EUR:
                        return
                }
            case .CAN:
                switch t {
                    case .GBP:
                        self.amount *= 0.4
                    case .USD:
                        self.amount *= 0.8
                    case .EUR:
                        self.amount *= 1.2
                    case .CAN:
                        return
                }
        }
        self.currency = t
    }
}

var wallet = Money()
wallet.add(amount: 20, currency: .USD)

wallet.convert(type: .USD)

print("\(wallet.currency)")

print("I got \(wallet.amount) \(wallet.currency) in my wallet")


