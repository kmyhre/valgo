//
//  InputView.swift
//  SLCalc
//
//  Created by Kristian Myhre
//
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
                    
#if targetEnvironment(simulator)
                    // Testing area begin
                    Button("Populate with test data") {
                        election.partiesArray = Constants.alternativTestData
                    }
                    Button("Populate with Norwegian test data") {
                        election.partiesArray = Constants.testData
                    }
                    // Testing area end
#endif
                    
                    HStack {
                        Spacer()
                        if election.partiesArray.isEmpty {
                            Text("Add parties in order to calculate election")
                                .foregroundColor(.secondary)
                        } else {
                            Text("\(election.partiesArray.count) parties")
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                }
                
                .navigationBarTitle(LocalizedStringKey("Parties"))
                
                VStack {
                    HStack {
                        Spacer()
                        Button("Preferences") {
                            showingPref.toggle()
                        }
                        .controlSize(.large)
                        
                        
                        Spacer()
                        if election.partiesArray.isEmpty {
                            Button("Add Party") {
                                showingAdd.toggle()
                            }
                            .buttonStyle(.bordered)
                            .controlSize(.large)
                            .controlProminence(.increased)
                            
                        } else {
                            Button("Add Party") {
                                showingAdd.toggle()
                            }
                            .buttonStyle(.bordered)
                            .controlSize(.large)
                            .controlProminence(.standard)
                            
                            
                        }
                        Spacer()
                    }
                    NavigationLink("Calculate Election", destination: ResultsView().environmentObject(election))
                        .buttonStyle(.bordered)
                        .controlSize(.large)
                        .controlProminence(.increased)
                        .disabled(election.partiesArray.isEmpty)
                    
                    
                }
                
                
            }
            
        }
        
        .sheet(isPresented: $showingAdd, onDismiss: {}, content: {AddParty()})
        .sheet(isPresented: $showingPref, onDismiss: {}, content: {SideBar()})
    }
}


//struct InputView_Previews: PreviewProvider {
//    static var previews: some View {
//        InputView()
//    }
//}
