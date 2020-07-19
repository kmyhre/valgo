//
//  SwiftUIView.swift
//  sl-calc
//
//  Created by Kristian Myhre on 10/07/2020.
//  Copyright © 2020 Kristian Myhre. All rights reserved.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        List {
            Section {
                Text("Item 1")
                Text("Item 2")
                Text("Item 3")
            }

            Section {
                Text("Item 4")
                Text("Item 5")
                Text("Item 6")
            }
        }.listStyle(InsetGroupedListStyle())
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
