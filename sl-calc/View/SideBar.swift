//
//  SideBar.swift
//  sl-calc
//
//  Created by Kristian Myhre on 10/07/2020.
//  Copyright © 2020 Kristian Myhre. All rights reserved.
//

import SwiftUI

struct SideBar: View {
    
    @EnvironmentObject var election: Election
    @State var modifiedDivisorString: String = "1.4"
    @State var seatsToAllocateString: String = "10"
    
    var body: some View {
        
        VStack {
            List {
                Section {
                    HStack {
                        Text("Seats to allocate")
                            .foregroundColor(.gray)
                        Spacer()
                        TextField("", text: $seatsToAllocateString)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                            .onChange(of: seatsToAllocateString) { value in
                                if let seatsInteger = Int(value) {
                                    election.seatsToAllocate = seatsInteger
                                    print("election.seatsToAllocate is now \(election.seatsToAllocate)")
                                }
                            }

                    }
                    Toggle("Modified method", isOn: $election.modifiedMethod )
                        .foregroundColor(.gray)
                        .onChange(of: election.modifiedMethod) { value in
                            election.modifiedMethod = value
                            print("Modified method is now \(value)")
                        }
                        
                    HStack {
                        Text("First dividend:")
                            .foregroundColor(.gray)
                        Spacer()
                        TextField("", text: $modifiedDivisorString)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .disabled(!election.modifiedMethod)
                            .onChange(of: modifiedDivisorString) { value in
                                if let floatValue = Float(value) {
                                    election.modifiedDivisor = floatValue
                                    print("election.modifiedDivisor is now \(election.modifiedDivisor) (\(floatValue))")
                                }
                            }


                    }
                    Text("")
                    Text("Text")
                    HStack {
                        Spacer()
                        Button("Button") {}
                            .foregroundColor(Color(UIColor.link))
                        Spacer()
                    }
                }

                
                Section {
                    Text("Meh")
                }
                
            }
            .listStyle(InsetGroupedListStyle())
            
        }
    }
    
}

//struct SideBar_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            SideBar()
//        }
//    }
//}

struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
