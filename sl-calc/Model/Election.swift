import SwiftUI
import Foundation

class Election: ObservableObject {
    
        @Published var modifiedMethod: Bool = true
        @Published var modifiedDivisor: Float = 1.4
        @Published var seatsToAllocate: Int = 10
        @Published var partiesArray: [Party] = []
        @Published var currentID: Int = 0
        @Published var seatsAwarded: [(seat: Int, party: String)] = []
        
    
    func calculateElection() {
        
        for party in partiesArray {
            // Find first quotient
            if modifiedMethod {
                party.currentDivisor = Float(modifiedDivisor)
            } else {
                party.currentDivisor = Float(1)
            }
            party.quotients = [(divisor: party.currentDivisor, quotient: Float(party.votesCast) / party.currentDivisor)]
            
            print("\(party.partyName) got \(party.votesCast) votes, and has \(party.quotients[0].quotient) votes at first divisor \(party.currentDivisor).")
            
            // Calculate the rest of the quotients

            party.currentDivisor = 3

            for _ in 2...seatsToAllocate {
                party.quotients.append((divisor: party.currentDivisor, quotient: Float(party.votesCast)/party.currentDivisor))
                party.currentDivisor += 2
            }
            
        }
        

        var allocatedSeats = 0
        for party in partiesArray {
            party.seatsWon = 0
            party.icon = nil
        }
        print("\nIn this election, \(seatsToAllocate) seats will be awarded according to each party's votes.")
        
        while (allocatedSeats < seatsToAllocate) {
            allocatedSeats = allocatedSeats + 1
            partiesArray = sortPartiesByNextQuotient(parties: partiesArray)
            partiesArray[0].seatWon()
            seatsAwarded.append((seat: allocatedSeats, party: partiesArray[0].partyName))
        }
        
        // Find last party to be awarded a seat
        partiesArray[0].icon = "exclamationmark.triangle"
        
        // Find next party to be awarded a seat
        partiesArray = sortPartiesByNextQuotient(parties: partiesArray)
        partiesArray[0].icon = "chevron.up.circle.fill"
        
        
        partiesArray = sortPartiesBySeats(parties: partiesArray)
        
        print ("\nThe final results are:")
        for party in partiesArray {
            print("\(party.partyName): \(party.seatsWon) seats")
        }
    }
    
    func addParty(name: String, votes: Int) {
        partiesArray.append(Party(name: name, votes: votes, identity: currentID))
//        if let _ = quotients {
//            quotients!.append(calculateQuotients(identity: currentID, originalVotes: Float(votes)))
//        } else {
//            quotients = [calculateQuotients(identity: currentID, originalVotes: Float(votes))]
//        }
        currentID += 1
        
        print("Party added: \(name)")
    }
    
//    func calculateQuotients(identity: Int, originalVotes: Float) -> [(dividend: Float, quotient: Float)] {
//
//        var quotients: [(dividend: Float, quotient: Float)] = []
//
//
//        if modifiedMethod {
//            quotients.append((dividend: modifiedDivisor, quotient: originalVotes/modifiedDivisor) )
//        } else {
//            quotients.append((dividend: 1, quotient: originalVotes/1))
//        }
//
//        var currentDividend: Float = 3
//
//        for _ in 2...seatsToAllocate {
//            quotients.append((dividend: currentDividend, quotient: originalVotes/currentDividend))
//            currentDividend += 2
//        }
//
//        print(quotients)
//        return quotients
//
//    }
    
    func printParties(parties: [Party]) {
        for party in parties {
            print("\(party.partyName) (\(party.remainingVotes) votes), ")
        }
    }
    
    func sortPartiesByNextQuotient(parties: [Party]) -> [Party] {
        let tempParties = parties.sorted(by: { id, id2 in
            return id.quotients[id.nextQuotient].quotient > id2.quotients[id2.nextQuotient].quotient
        })
        return tempParties
    }
    
    func sortPartiesBySeats(parties: [Party]) -> [Party] {
        let tempParties = parties.sorted(by: { id, id2 in
            return id.seatsWon > id2.seatsWon
        })
        return tempParties
    }

    
}
