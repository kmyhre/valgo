
import Foundation

func printParties(parties: [Party]) {
    for party in parties {
        print("\(party.partyName) (\(party.remainingVotes) votes), ")
    }
}
