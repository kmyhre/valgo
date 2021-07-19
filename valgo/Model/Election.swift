import SwiftUI
import Foundation

class Election: ObservableObject {
    
        @Published var modifiedMethod: Bool = true
        @Published var modifiedDivisor: Float = 1.4
        @Published var seatsToAllocate: Int = 10
        @Published var partiesArray: [Party] = []
        @Published var currentID: Int = 0
        @Published var seatsAwarded: [(seat: Int, party: Party)] = []
        
    // MARK: calculateElection
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

            for _ in 2...seatsToAllocate+1 {
                party.quotients.append((divisor: party.currentDivisor, quotient: Float(party.votesCast)/party.currentDivisor))
                party.currentDivisor += 2
            }
        }
        
        // Reset data to prepare for subsequent executions
        var allocatedSeats = 0
        seatsAwarded = []
        for party in partiesArray {
            party.seatsWon = 0
            party.icon = nil
            party.nextQuotient = 0
        }
        print("\nIn this election, \(seatsToAllocate) seats will be awarded according to each party's votes.")
        
        while (allocatedSeats < seatsToAllocate) {
            allocatedSeats = allocatedSeats + 1
            partiesArray = sortPartiesByNextQuotient(parties: partiesArray)
            partiesArray[0].seatWon()
            seatsAwarded.append((seat: allocatedSeats, party: partiesArray[0]))
        }
        
        // Find last party to be awarded a seat
        partiesArray[0].icon = "exclamationmark.triangle"
        
        // Find next party to be awarded a seat
        partiesArray = sortPartiesByNextQuotient(parties: partiesArray)
        partiesArray[0].icon = "chevron.up.circle"
        
        
        partiesArray = sortPartiesBySeats(parties: partiesArray)
        
        print ("\nThe final results are:")
        for party in partiesArray {
            print("\(party.partyName): \(party.seatsWon) seats")
        }
    }
    
    
    
    // MARK: addParty
    
    func addParty(name: String, votes: Int, color: Color) {
        partiesArray.append(Party(name: name, votes: votes, color: color))
        
        print("Party added: \(name)")
    }
    
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
