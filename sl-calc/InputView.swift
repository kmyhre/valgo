//
//  InputView.swift
//  SLCalc
//
//  Created by Kristian Myhre on 07/07/2020.
//  Copyright © 2020 Kristian Myhre. All rights reserved.
//

import SwiftUI

struct InputView: View {
    

    var parties: [Party] = testData
    var election = Election(modified: true, seats: 18)
    
    var body: some View {
        VStack {
            NavigationView {
                    List(parties) { party in
                        partyCell(party: party)
                    }
                .navigationBarTitle("Parties")
                .navigationBarItems(trailing:
                    Button("New") {
                        print("add tapped!")
                        
                    })
            }
            Button(action: {self.election.calculateElection()}) {
                Text("Calculate election")
            }
        }
        .onAppear {
            Constants.partiesArray = self.parties
        }
    }
}


struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(parties: testData)
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


