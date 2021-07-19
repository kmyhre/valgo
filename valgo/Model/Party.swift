import Foundation
import SwiftUI

class Party: Identifiable, ObservableObject {

    
    let partyName: String
    let partyColor: Color
    let votesCast: Int
    var remainingVotes: Float
    var currentDivisor: Float
    var nextQuotient: Int = 0
    var quotients: [(divisor: Float, quotient: Float)] = []
    var seatsWon: Int = 0
    var id: UUID = UUID()
    var icon: String?
    
    // For formatting votes numbers
    let formatter = NumberFormatter()
    var votesFormatted: String {
        return formatter.string(for: votesCast)!
    }
    
    
    init(name: String, votes: Int, color: Color) {
        partyName = name
        votesCast = votes
        remainingVotes = Float(votesCast)
        currentDivisor = 0
        formatter.numberStyle = NumberFormatter.Style.decimal
        partyColor = color
    }
    
    func seatWon() {
        seatsWon += 1
        nextQuotient += 1
        print("\(self.partyName) won a seat.")
    }
}
