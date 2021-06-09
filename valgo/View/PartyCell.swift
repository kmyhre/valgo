//
//  PartyCell.swift
//  valgo
//
//  Created by Kristian Myhre
//

import Foundation
import SwiftUI

struct partyCell: View {
    var party: Party
    var body: some View {
        HStack {
            Circle()
                .foregroundColor(Color(party.partyColor))
                .fixedSize()

            
            Text(party.partyName)
            Spacer()
            Text("\(party.votesFormatted) votes")
                .font(.footnote)
        }
    }
}
