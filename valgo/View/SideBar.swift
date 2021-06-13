//
//  SideBar.swift
//  sl-calc
//
//  Created by Kristian Myhre
//

import SwiftUI

struct SideBar: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var election: Election
    @State var modifiedDivisorString: String = ""
    @State var seatsToAllocateString: String = ""
    @State var firstDivisorInt: Int = 1
    @State var firstDivisor: Float = 1.0
    @State var seatsToAllocate: Int = 10
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                List {
                    Section() {
                        HStack {
                            Text("Seats to allocate")
                                .foregroundColor(.gray)
                                TextField("", text: $seatsToAllocateString, prompt: Text("10"))
                                    .keyboardType(.numberPad)
                                    .multilineTextAlignment(.trailing)
                                    .onAppear(perform: {
                                        seatsToAllocateString = String(election.seatsToAllocate)})
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
                        
                        if election.modifiedMethod {
                            VStack {
                                HStack {
                                    Text("First divisor:")
                                        .foregroundColor(.gray)
                                    Spacer()
                                    Text(String(election.modifiedDivisor))
                                }
                                HStack {
                                    Slider(value: $firstDivisor, in: 1.0...2.0, step: 0.1)
                                        .onAppear(perform: {firstDivisor = election.modifiedDivisor})
                                        .onChange(of: firstDivisor, perform: { value in
                                            firstDivisor = Float(round(10*value)/10)
                                            election.modifiedDivisor = firstDivisor
                                            print("election.modifiedDivisor is now \(election.modifiedDivisor)")
                                        })
                                        .disabled(!election.modifiedMethod)
                                }
                                
                            }
                        }
                        
                    }
                    HStack {
                        Spacer()
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Text("Dismiss")
                        })
                        Spacer()
                    }
                }
                .listStyle(GroupedListStyle())
                .navigationTitle("Settings")
            }
        }
    }
    
}

//struct SideBar_Previews: PreviewProvider {
//
//    static var previews: some View {
//            SideBar()
//    }
//}
