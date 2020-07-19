//
//  InputView.swift
//  SLCalc
//
//  Created by Kristian Myhre on 07/07/2020.
//  Copyright © 2020 Kristian Myhre. All rights reserved.
//

import SwiftUI

struct InputView: View {
    
    @State var showingAdd = false
    @State var showingPref = false
    @State var modifiedMethod: Bool = false
    @EnvironmentObject var election: Election
    
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                List {
                    ForEach (election.partiesArray) { party in
                        partyCell(party: party)
                    }
                    Button {
                        election.partiesArray = Constants.alternativTestData
                    } label: {
                        Text("Populate with test data")
                    }
                    Button {
                        election.partiesArray = Constants.testData
                    } label: {
                        Text("Populate with Norwegian test data")
                    }

                    HStack {
                        Spacer()
                        Text("\(election.partiesArray.count) parties")
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                }
                .listStyle(InsetGroupedListStyle())
                
                NavigationLink("Calculate election", destination: ResultsView().environmentObject(election))
                    
                    // First row of navbar shenanigans
                    .navigationBarTitle("Parties")
                    .navigationBarItems(
                        leading:
                            NavigationLink(
                                destination: SideBar(),
                                isActive: $showingPref,
                                label: {
                                    Image(systemName: "gear")
                                        .imageScale(.large)
                                })
                            .padding(),
                        trailing:
                            Button(action: {
                                self.showingAdd.toggle()
                            }) {
                                Image(systemName: "plus")
                            }.sheet(isPresented: $showingAdd) {
                                AddParty(showingAdd: $showingAdd).environmentObject(election)
                            }

                            
                            
                    )
            }
        }
    }
}
    
    
    struct InputView_Previews: PreviewProvider {
        static var previews: some View {
            InputView()
                .preferredColorScheme(.light)
        }
    }
    
    
    struct partyCell: View {
        var party: Party
        var body: some View {
            HStack {
                
                Text(party.partyName)
                Spacer()
                Text("\(party.votesFormatted) votes")
                    .font(.footnote)
                
            }
        }
    }

