//
//  PartyCell.swift
//  valgo
//
//  Created by Kristian Myhre on 28/12/2020.
//  Copyright © 2020 Kristian Myhre. All rights reserved.
//

import Foundation
import SwiftUI

struct partyCell: View {
    var party: Party
    var body: some View {
        HStack {
            Circle()
                .foregroundColor(Color(party.partyColor))
                .frame(width: 15, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

            
            Text(party.partyName)
            Spacer()
            Text("\(party.votesFormatted) votes")
                .font(.footnote)
        }
    }
}
