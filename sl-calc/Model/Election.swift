
import Foundation

class Election {
        
    
    func calculateElection() {
        var allocatedSeats = 0
        print("\nIn this election, \(Constants.seatsToAllocate) seats will be awarded according to each party's votes.")
        var parties = Constants.partiesArray
        while (allocatedSeats < Constants.seatsToAllocate) {
            allocatedSeats = allocatedSeats + 1
            parties = sortParties(parties: parties)
            parties[0].seatWon()
        }
        
        print ("\nThe final results are:")
        for party in parties {
            print("\(party.partyName): \(party.seatsWon) seats")
        }
    }
    
    static func addParty(name: String, votes: Int) {
        Constants.partiesArray.append(Party(name: name, votes: votes, identity: Constants.currentID))
        Constants.currentID += 1
        print("Party added: \(name)")
    }
    
    
}
