//
//  Constants.swift
//  sl-calc
//
//  Created by Kristian Myhre on 07/07/2020.
//  Copyright © 2020 Kristian Myhre. All rights reserved.
//
import SwiftUI


class Constants {
    static var modifiedMethod: Bool = false
    static var modifiedDivisor: Float = 1.4
    static var seatsToAllocate: Int = 0
    static var partiesArray: [Party] = []
    static var currentID: Int = 0
}


var testData: [Party] = [
    Party(name: "Arbeiderpartiet", votes: 104089, identity: 1),
    Party(name: "Høyre", votes: 97085, identity: 2),
    Party(name: "Fremskrittspartiet", votes: 35037, identity: 3),
    Party(name: "Sosialistisk Venstreparti", votes: 34052, identity: 4),
    Party(name: "Venstre", votes: 30933, identity: 5),
    Party(name: "Rødt", votes: 23083, identity: 6),
    Party(name: "Miljøpartiet De Grønne", votes: 21853, identity: 7),
    Party(name: "Kristelig Folkeparti", votes: 7843, identity: 8)
]

var alternativTestData: [Party] = [
    Party(name: "Labour Party", votes: 104089, identity: 1),
    Party(name: "Conservative Party", votes: 97085, identity: 2),
    Party(name: "Liberal Party", votes: 35037, identity: 3),
    Party(name: "Some Other Party", votes: 34052, identity: 4),
    Party(name: "Yet Another Party", votes: 30933, identity: 5),
    Party(name: "Republican Party", votes: 23083, identity: 6),
    Party(name: "Democratic Party", votes: 21853, identity: 7),
    Party(name: "Not A Very Popular Party", votes: 7843, identity: 8)

]
