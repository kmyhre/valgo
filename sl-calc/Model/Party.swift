import Foundation
import SwiftUI

class Party: Identifiable, ObservableObject {

    
    let partyName: String
    let votesCast: Int
    var remainingVotes: Float
    var currentDivisor: Float
    var nextQuotient: Int = 0
    var quotients: [(divisor: Float, quotient: Float)] = []
    var seatsWon: Int = 0
    var id: Int
    var icon: String?
    
    // For formatting votes numbers
    let formatter = NumberFormatter()
    var votesFormatted: String {
        return formatter.string(for: votesCast)!
    }
    
    
    init(name: String, votes: Int, identity: Int) {
        id = identity
        partyName = name
        votesCast = votes
        remainingVotes = Float(votesCast)
        currentDivisor = 0
        formatter.numberStyle = NumberFormatter.Style.decimal

//        if modifiedMethod {
//            currentDivisor = Float(modifiedDivisor)
//        } else {
//            currentDivisor = 1
//        }
//        remainingVotes = Float(votesCast) / currentDivisor
//
//        print("\(self.partyName) got \(self.votesCast) votes, and has \(self.remainingVotes) votes at first divisor \(currentDivisor).")
        
        // This should change to calculating first divisor when «calculate election» is pressed, to avoid parties being added with different first divisors.
        
    }
    
    func seatWon() {
        seatsWon += 1
        nextQuotient += 1
        print("\(self.partyName) won a seat.")
    }
}
