import Foundation

func sortParties(parties: [Party]) -> [Party] {
    let tempParties = parties.sorted(by: { id, id2 in
        return id.remainingVotes > id2.remainingVotes
    })
    return tempParties
}
