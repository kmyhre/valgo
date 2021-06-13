//
//  AddParty.swift
//  sl-calc
//
//  Created by Kristian Myhre
//

import SwiftUI

struct AddParty: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name: String = ""
    @State private var votes: String = ""
    @EnvironmentObject var election: Election
    
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Party", text: $name)
                        TextField("Votes", text: $votes)
                            .keyboardType(.numberPad)

                
                    Button(action: {
                        if let votesInt = Int(votes) {
                            
                            election.addParty(name: name, votes: votesInt)
                            
                            presentationMode.wrappedValue.dismiss()
                            
                        }
                    }, label: {
                        Text("Add Party")
                    })
                        .buttonStyle(.bordered)
                        .controlSize(.large)
                        .controlProminence(.increased)
                        .disabled(votes == "" || name == "")
                        
                }
                
            }
            .navigationBarTitle("Add Party")
        }
    }
    
}


struct AddParty_Previews: PreviewProvider {
    static var previews: some View {
        AddParty()
    }
}
