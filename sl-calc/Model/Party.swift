import Foundation

class Party: Election {

    let partyName: String
    let votesCast: Int
    var remainingVotes: Float
    var currentDivisor: Float
    var seatsWon: Int = 0
    
    init(name: String, votes: Int) {
        partyName = name
        votesCast = votes
        remainingVotes = Float(votesCast)
        currentDivisor = 0
        super.init()

        if modifiedMethod {
            currentDivisor = Float(modifiedDivisor)
        } else {
            currentDivisor = 1
        }
        remainingVotes = Float(votesCast) / currentDivisor
        
        print("\(self.partyName) got \(self.votesCast) votes, and has \(self.remainingVotes) votes at first divisor \(currentDivisor).")
        
    }
    
    func seatWon() {
        seatsWon = seatsWon + 1

        if currentDivisor == modifiedDivisor {
            currentDivisor = 3
        } else {
            currentDivisor = currentDivisor + 2
        }
        remainingVotes = Float(votesCast) / currentDivisor
        
        print("\(self.partyName) won a seat. The party's new vote count is \(self.remainingVotes) at divisor \(self.currentDivisor), and this is seat number \(self.seatsWon) for this party.")
        
    }
}
