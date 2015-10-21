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

//domain-modeling part 2
protocol CustomStringConvertible {
    var description : String { get }
}

protocol Mathematics {
    func addition(left: Self, right: Self) -> Self
    func subtraction(left: Self, right: Self) -> Self
}

/*
 * Testing Money struct
 */

//domain-modeling part 2
print("testing CustomStringConvertible\n")

var moneys = Money(amount: 20, currency: .USD)

print("\(moneys.description)")

print("Money test cases...\n")
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

wallet.subtract(amount: 50, currency: .CAN)
print("Spent 50 CAN, now I have \(wallet.getTotal()) CAN.\n")


/*
 * Testing Job class
 */

print("\n")
print("Testing Job class...\n")

var job = Job(jobTitle: "Engineer", jobSalary: 90000, hourly: false)

print("This engineer makes \(job.calculateIncome()) annually.\n")

job.raise(15)
print("Let's give him a 15% raise. He now makes \(job.calculateIncome()).\n")

var hourlyEmp = Job(jobTitle: "Waitress", jobSalary: 15, hourly: true)
print("A person that earns $15 an hour, makes roughly \(hourlyEmp.calculateIncome(hours: 2000)) in a year.\n\n")

//domain-modeling part 2
print("testing CustomStringConvertible\n")
print("\(job.description)\n")

/*
 * Testing person class
 */

print("Testing Person class...\n")

var president = Person(first: "Brack", last: "Obama", age: 54, job: Job(jobTitle: "President", jobSalary: 400000, hourly: false))
var firstLady = Person(first: "Michelle", last: "Obama", age: 51, job: Job(jobTitle: "First Lady", jobSalary: 300000, hourly: false))
var malia = Person(first: "Malia", last: "Obama", age: 17)

president.spouse = firstLady
firstLady.spouse = president
print("\(president.toString())\n")
print("\(firstLady.toString())\n\n\n")

//domain-modeling part 2
print("testing CustomStringConvertible\n")
print("\(president.description)\n")

/*
 * Testing family class
 */

print("Testing Fam class...\n")
var firstFam = famClass(fam: [president, firstLady, malia])

print("The first family makes \(firstFam!.householdIncome()) per year.\n")

var illegalFam = famClass(fam: [Person(first: "James", last: "Jones", age: 12)])
print("Creating a family of one 12 year old, James...\n")

if illegalFam != nil {
    print("Legal family.\n")
} else {
    print("Illegal family.\n")
}

var legalFam = famClass(fam: [Person(first: "William", last: "Joseph", age: 23)])
print("Creating a family of one 23 year old, William...\n")

if legalFam != nil {
    print("Legal family.\n")
} else {
    print("Illegal family.\n")
}

//domain-modeling part 2
print("testing CustomStringConvertible\n")
print("\(firstFam!.description)\n")






