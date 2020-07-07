//
//  Constants.swift
//  sl-calc
//
//  Created by Kristian Myhre on 07/07/2020.
//  Copyright © 2020 Kristian Myhre. All rights reserved.
//


struct Constants {
    static var modifiedMethod: Bool = true
    static let modifiedDivisor: Float = 1.4
    static var seatsToAllocate: Int = 0
    static var partiesArray: [Party] = []
    
    
    
    
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
