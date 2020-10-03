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
                
                
                //                .navigationBarItems(
                //                    leading:
                //                        Button(action: {
                //                            self.showingPref.toggle()
                //                        }) {
                //                            Image(systemName: "gear")
                //                                .imageScale(.large)
                //                        }
                //                        .sheet(isPresented: $showingPref) {
                //                            SideBar(showingPref: $showingPref).environmentObject(election)
                //                        }
                //                        .padding(),
                //                    trailing:
                //                        Button(action: {
                //                            self.showingAdd.toggle()
                //                        }) {
                //                            Image(systemName: "plus")
                //                                .imageScale(.large)
                //                        }.sheet(isPresented: $showingAdd) {
                //                            AddParty(showingAdd: $showingAdd).environmentObject(election)
                //                        }
                //                )
                ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
                    GeometryReader { geometry in
                        HStack(alignment: .center, spacing: 0){
                            NavigationLink("Settings", destination: SideBar(showingPref: $showingPref))
                                .frame(width: geometry.size.width / 2, height: 80)
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .sheet(isPresented: $showingAdd) {
                                    AddParty(showingAdd: $showingAdd).environmentObject(election)
                                }
                            NavigationLink("""
                                            Calculate
                                            Election
                                            """, destination: ResultsView().environmentObject(election))
                                .frame(width: geometry.size.width / 2, height: 80)

                                .foregroundColor(Color.white)
                                .background(election.partiesArray.isEmpty ? Color.gray : Color.purple)
                                .disabled(election.partiesArray.isEmpty)
                        }
                    }
                    
                    Button(action: { self.showingAdd.toggle() } ) {
                        ZStack {
                            Circle()
                                .foregroundColor(.green)

                            Image(systemName: "plus")
                                .imageScale(.large)
                                .foregroundColor(.white)
                                .font(Font.system(size:50))
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                        }


                    }
                    .fixedSize()
                    
                }
                .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}


//struct InputView_Previews: PreviewProvider {
//    static var previews: some View {
//        InputView()
//    }
//}


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

