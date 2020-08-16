//
//  ResultsView.swift
//  sl-calc
//
//  Created by Kristian Myhre on 14/07/2020.
//  Copyright © 2020 Kristian Myhre. All rights reserved.
//

import SwiftUI

struct ResultsView: View {
    @EnvironmentObject var election: Election
    @State var seatBoxWidth: Int = 0
    
    
    var body: some View {
        List {
            Section(header: Text("Seats per party")) {
                ForEach (election.partiesArray, id: \.id) { party in
                    HStack {
                        Text(party.partyName)
                        Spacer()
                        if let icon = party.icon {
                            Image(systemName: icon)
                        }
                        if party.seatsWon == 1 {
                            Text("\(String(party.seatsWon)) seat")
                                .multilineTextAlignment(.leading)
                                .frame(width: 90)
                        } else {
                            Text("\(String(party.seatsWon)) seats")
                                .multilineTextAlignment(.leading)
                                .frame(width: 90)
                        }
                    }
                }
                HStack {
                    Image(systemName: "chevron.up.circle")
                    Text("Closest to gaining a seat")
                        .font(.caption)
                    Spacer()
                    Image(systemName: "exclamationmark.triangle")
                    Text("Closest to losing a seat")
                        .font(.caption)
                }
                .listRowBackground(Color(.secondarySystemBackground))
            }
            Section(header: Text("Allocation of seats")) {
                ForEach (election.seatsAwarded, id: \.seat) { currentSeat in
                    HStack {
                        Text("Seat \(String(currentSeat.seat)):")
                        Spacer()
                        Text(currentSeat.party)
                    }
                }
            }
        }.onAppear(perform: election.calculateElection)
        //.listStyle(InsetGroupedListStyle())
        .listStyle(GroupedListStyle())
        .navigationBarTitle("Election Results")
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
    }
}

extension HorizontalAlignment {
    struct MidAccountAndName: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.trailing]
        }
    }

    static let midAccountAndName = HorizontalAlignment(MidAccountAndName.self)
}
