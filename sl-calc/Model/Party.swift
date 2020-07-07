import Foundation

class Party: Identifiable {

    let partyName: String
    let votesCast: Int
    var remainingVotes: Float
    var currentDivisor: Float
    var seatsWon: Int = 0
    var id: Int
    
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

                if Constants.modifiedMethod {
            currentDivisor = Float(Constants.modifiedDivisor)
        } else {
            currentDivisor = 1
        }
        remainingVotes = Float(votesCast) / currentDivisor
        
        print("\(self.partyName) got \(self.votesCast) votes, and has \(self.remainingVotes) votes at first divisor \(currentDivisor).")
        
    }
    
    func seatWon() {
        seatsWon = seatsWon + 1

        if currentDivisor == Constants.modifiedDivisor {
            currentDivisor = 3
        } else {
            currentDivisor = currentDivisor + 2
        }
        remainingVotes = Float(votesCast) / currentDivisor
        
        print("\(self.partyName) won a seat. The party's new vote count is \(self.remainingVotes) at divisor \(self.currentDivisor), and this is seat number \(self.seatsWon) for this party.")
        
    }
}
