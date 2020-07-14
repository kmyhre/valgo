//
//  AddParty.swift
//  sl-calc
//
//  Created by Kristian Myhre on 07/07/2020.
//  Copyright © 2020 Kristian Myhre. All rights reserved.
//

import SwiftUI

struct AddParty: View {
    
    @State private var name: String = ""
    @State private var votes: String = ""
    @Binding var showingAdd: Bool
    
    var body: some View {
        VStack {

            Form {
                TextField("Party", text: $name)
                TextField("Votes", text: $votes)
                    .keyboardType(.numberPad)
                Button(action: {
                    if let votesInt = Int(votes) {
                        Election.addParty(name: name, votes: votesInt)
                        showingAdd = false
                        
                    }
                }, label: {
                    Text("Add Party")
                })
            }
        }
        .padding()
    }
}


//struct AddParty_Previews: PreviewProvider {
//    static var previews: some View {
//        AddParty(showingAdd: )
//    }
//}
