//
//  ResultsView.swift
//  sl-calc
//
//  Created by Kristian Myhre on 14/07/2020.
//  Copyright © 2020 Kristian Myhre. All rights reserved.
//

import SwiftUI

struct ResultsView: View {
    @EnvironmentObject var election: Election

    var body: some View {
        NavigationView {
            Text("Swell!")
                .navigationTitle("Election results")
        }.onAppear(perform: election.calculateElection)

    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
    }
}
