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
    @State private var color: Color = .black
    @State private var defaultColors: [Color] = Constants.defaultColors
    @EnvironmentObject var election: Election
    var items: [GridItem] = Array(repeating: .init(), count: 1)

    
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Party", text: $name)
                        TextField("Votes", text: $votes)
                            .keyboardType(.numberPad)
                    ColorPicker("Color", selection: $color, supportsOpacity: false)


                    HStack {
                        Spacer()
                        Button(action: {
                            if let votesInt = Int(votes) {
                                
                                election.addParty(name: name, votes: votesInt, color: color)
                                
                                presentationMode.wrappedValue.dismiss()
                                
                            }
                        }, label: {
                            Text("Add Party")
                        })
                            .buttonStyle(.bordered)
                            .controlSize(.large)
                            .controlProminence(.increased)
                            .disabled(votes == "" || name == "")
                        Spacer()
                    }

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
