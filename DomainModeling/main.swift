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

struct Money: CustomStringConvertible {
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
}

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
 * JOB class
 */

class Job: CustomStringConvertible {
    
    var title : String
    
    var salary : Double
    
    var hourly : Bool
    
    init(jobTitle : String, jobSalary : Double, hourly: Bool) {
        self.title = jobTitle
        self.salary = jobSalary
        self.hourly = hourly
    }
    
    func calculateIncome(hours h : Double = 0.0) -> Double {
        if (hourly) {
            return self.salary * h
        } else {
            return self.salary
        }
    }
    
    func raise(percentage: Double) -> Void {
        self.salary *= 1 + (percentage / 100)
    }
    
    //domain-modeling part 2
    var description: String { return "Title: \(self.title)\nSalary: \(self.salary)\nHourly: \(self.hourly)" }
    
}

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






