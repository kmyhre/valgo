import SwiftUI

class Constants {
static var alternativTestData: [Party] = [
    Party(name: "Labour Party", votes: 104089, color: Color.red),
    Party(name: "Conservative Party", votes: 97085, color: Color.blue),
    Party(name: "Liberal Party", votes: 35037, color: Color.green),
    Party(name: "Some Other Party", votes: 34052, color: Color.brown),
    Party(name: "Yet Another Party", votes: 30933, color: Color.mint),
    Party(name: "Republican Party", votes: 23083, color: Color.orange),
    Party(name: "Democratic Party", votes: 21853, color: Color.indigo),
    Party(name: "Not A Very Popular Party", votes: 7843, color: Color.yellow)

]
    static var testData: [Party] = [
        Party(name: "Arbeiderpartiet", votes: 104089, color: Color.red),
        Party(name: "Høyre", votes: 97085, color: Color.blue),
        Party(name: "Fremskrittspartiet", votes: 35037, color: Color.brown),
        Party(name: "Sosialistisk Venstreparti", votes: 34052, color: Color.pink),
        Party(name: "Venstre", votes: 30933, color: Color.green),
        Party(name: "Rødt", votes: 23083, color: Color.red),
        Party(name: "Miljøpartiet De Grønne", votes: 21853, color: Color.green),
        Party(name: "Kristelig Folkeparti", votes: 7843, color: Color.yellow)
    ]
    static var defaultColors: [Color] = [
        Color.red,
        Color.blue,
        Color.green,
        Color.purple,
        Color.pink,
        Color.orange,
        Color.mint,
        Color.brown,
        Color.indigo,
        Color.yellow
    ]
}
