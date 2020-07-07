
import Foundation

class Election {
    
    init(modified: Bool, seats: Int) {
        Constants.modifiedMethod = modified
        Constants.seatsToAllocate = seats
    }
    
    
    
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
    
    
}
