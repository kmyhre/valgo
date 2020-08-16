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
    @State var firstDivisorInt: Int = 1
    @State var firstDivisor: Float = 1.0
    @State var seatsToAllocate: Int = 10
    @Binding var showingPref: Bool
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                List {
                    Section() {
                        VStack {
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
                            Picker(selection: $seatsToAllocate, label: Text("Choose seats to allocate")) {
                                ForEach(1..<1000) {
                                    Text("\($0)")
                                }
                            }
                            .pickerStyle(WheelPickerStyle())
                        }
                        Toggle("Modified method", isOn: $election.modifiedMethod )
                            .foregroundColor(.gray)
                            .onChange(of: election.modifiedMethod) { value in
                                election.modifiedMethod = value
                                print("Modified method is now \(value)")
                            }
                        VStack {
                            HStack {
                                Text("First dividend:")
                                    .foregroundColor(.gray)
                                Spacer()
                                Text(String(firstDivisor))
                            }
                            
                            HStack {
                                Slider(value: $firstDivisor, in: 1.0...2.0, step: 0.1)
                                    .onChange(of: firstDivisor, perform: { value in
                                        firstDivisor = Float(round(10*value)/10)
                                        election.modifiedDivisor = firstDivisor
                                        print("election.modifiedDivisor is now \(election.modifiedDivisor)")
                                        
                                    })
                                    .disabled(!election.modifiedMethod)
                                
                                
                            }
                            
                            
                        }
                    }
                    HStack {
                        Spacer()
                        Button(action: {
                            showingPref.toggle()
                        }, label: {
                            Text("Dismiss")
                        })
                        Spacer()
                    }
                }
                //.listStyle(InsetGroupedListStyle())
                .listStyle(GroupedListStyle())
                .navigationTitle("Settings")
            }
        }
    }
    
}

//struct SideBar_Previews: PreviewProvider {
////    @State var showingPref = true
//
//    static var previews: some View {
//
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
