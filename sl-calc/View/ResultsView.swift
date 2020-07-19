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
    
    
    var body: some View {
            List {
                Section {
                    HStack {
                        Spacer()
                        Text("Seats per party")
                        Spacer()
                    }
                    ForEach (election.partiesArray, id: \.id) { party in
                        HStack {
                            Text(party.partyName)
                            Spacer()
                            if let icon = party.icon {
                                Image(systemName: icon)
                            }
                            if party.seatsWon == 1 {
                                Text("\(party.seatsWon) seat")
                            } else {
                                Text("\(party.seatsWon) seats")
                            }
                        }
                    }
                    
                }
                Section {
                    HStack {
                        Spacer()
                        Text("Allocation of seats")
                        Spacer()
                    }
                    ForEach (election.seatsAwarded, id: \.seat) { currentSeat in
                        HStack {
                            Text("Seat \(String(currentSeat.seat)):")
                            Spacer()
                            Text(currentSeat.party)
                        }
                        
                    }
                }
            }.onAppear(perform: election.calculateElection)
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Election Results")
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
    }
}
