//
//  SideBar.swift
//  sl-calc
//
//  Created by Kristian Myhre on 10/07/2020.
//  Copyright © 2020 Kristian Myhre. All rights reserved.
//

import SwiftUI

struct SideBar: View {
    
    var modifiedMethod: Bool = Constants.modifiedMethod
    var firstDividend: Float = Constants.modifiedDivisor
    var seatsToAllocate: Int = Constants.seatsToAllocate
    @State var currentModifiedMethod = false
    @State var currentFirstDividend = "1.4"
    @State var seatsToAllocateInt = String(Constants.seatsToAllocate)
    
    var body: some View {
        
        VStack {
            List {
                Section {
                    HStack {
                        Text("Seats to allocate")
                        Spacer()
                        TextField("", text: $seatsToAllocateInt)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                            .onChange(of: seatsToAllocateInt) { value in
                                if let seatsInteger = Int(value) {
                                    Constants.seatsToAllocate = seatsInteger
                                    print("Constants.seatsToAllocate is now \(Constants.seatsToAllocate)")
                                }
                            }
                            
                    }
                    Toggle("Modified method?!!", isOn: $currentModifiedMethod )
                        .onChange(of: currentModifiedMethod) { value in
                            Constants.modifiedMethod = value
                            print("Modified method is now \(value)")
                        }
                        
                    HStack {
                        Text("First dividend:")
                        Spacer()
                        TextField("", text: $currentFirstDividend)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .disabled(!currentModifiedMethod)
                            .onChange(of: currentFirstDividend) { value in
                                if let floatValue = Float(value) {
                                    Constants.modifiedDivisor = floatValue
                                    print("Modified divisor is now \(floatValue)")
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
