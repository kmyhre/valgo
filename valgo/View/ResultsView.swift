//
//  ResultsView.swift
//  sl-calc
//
//  Created by Kristian Myhre
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
                        if let icon = party.icon {
                            Image(systemName: icon)
                        } else {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 20, height: 20)
                        }

                        Text(party.partyName)
                        Spacer()
                        if party.seatsWon == 1 {
                            Text("\(String(party.seatsWon)) seat")
                        } else {
                            Text("\(String(party.seatsWon)) seats")

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
                        Text(currentSeat.party.partyName)
                        Circle()
                            .fixedSize()
                            .foregroundColor(currentSeat.party.partyColor)
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
