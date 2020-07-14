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
    @State var election = Election()
    @State var modifiedMethod: Bool = false
    @State var firstDividend = "1.4"

    
    var body: some View {
        
        NavigationView {
        
        VStack {
                List {
                    ForEach (Constants.partiesArray) { party in
                        partyCell(party: party)
                    }
                    HStack {
                        Spacer()
                        Text("\(Constants.partiesArray.count) parties")
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                }
                .listStyle(InsetGroupedListStyle())
            
        
            
        
        Button(action: {self.election.calculateElection()}) {
            Text("Calculate election")
        }
        }
        
        
                // First row of navbar shenanigans
                .navigationBarTitle("Parties")
                .navigationBarItems(
                    leading:
                        Button(action: {
                            self.showingPref.toggle()
                        }, label: {
                            Image(systemName: "gear")
                                .imageScale(.large)

                        }).sheet(isPresented: $showingPref) {
                            SideBar()
                        }
                    ,
                    trailing:
                        Button(action: {
                            showingAdd = true
                        }, label: {
                            Image(systemName: "plus")
                                .imageScale(.large)
                        })
                        .popover(isPresented: $showingAdd, attachmentAnchor: .point (UnitPoint.bottom), arrowEdge: .top) {
                            AddParty(showingAdd: $showingAdd)
                        }
                        
                )
        
                // Last row
        
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
