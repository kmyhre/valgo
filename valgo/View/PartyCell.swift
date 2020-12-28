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
            Text(party.partyName)
            Spacer()
            Text("\(party.votesFormatted) votes")
                .font(.footnote)
        }
    }
}
