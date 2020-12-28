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
                    
                    // #if targetEnvironment(simulator)
                    // Testing area begin
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
                    // Testing area end
                    //  #endif
                    
                    HStack {
                        Spacer()
                        if election.partiesArray.isEmpty {
                            Text("Add a party using the + button")
                                .foregroundColor(.secondary)
                        } else {
                            Text("\(election.partiesArray.count) parties")
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                }
                
                .listStyle(InsetGroupedListStyle())
                // .listStyle(GroupedListStyle())
                
                    
                .navigationBarTitle(LocalizedStringKey("Parties"))
                .navigationBarItems(
                    leading: Button(action: {self.showingPref.toggle() } ) {
                        ZStack {
                            Circle()
                            Image(systemName: "gear").font(navViewFont)
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets.init(top: 4, leading: 4, bottom: 4, trailing: 4))
                        }
                    }
                    
                        ,
                    trailing: Button(action: { self.showingAdd.toggle() } ) {
                        ZStack {
                            Circle()
                            Image(systemName: "plus").font(navViewFont)
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets.init(top: 4, leading: 4, bottom: 4, trailing: 4))


                        }
                    }
                )
                
                
                            NavigationLink("Calculate Election", destination: ResultsView().environmentObject(election))
                                .disabled(election.partiesArray.isEmpty)
                                .padding()
                
                
            }
        }
    }
    let navViewFont = Font
        .system(size: 24)
        .weight(.light)

}


//struct InputView_Previews: PreviewProvider {
//    static var previews: some View {
//        InputView()
//    }
//}
