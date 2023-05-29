//
//  registerCVVView.swift
//  IOS-Wallet-Copycat
//
//  Created by Caio Gomes Piteli on 25/05/23.
//

import SwiftUI

struct registerCVVView: View {
    
    @State var expirationDate = Date.now
    @State var securityCode = ""
    @ObservedObject var modalStates: ModalStates
    
    var body: some View {
        VStack{
                
                Text("Card Details")
                    .padding()
                    .font(.largeTitle)
                    .bold()
                
            Text("Enter your card information.")
                    .multilineTextAlignment(.center)
                    .frame(width: 350)
                    .font(.body)
                
                Form{
                    
                    HStack{
        
                        DatePicker(selection: $expirationDate, in: ...Date.distantFuture, displayedComponents: .date)
                        {
                            Text("Select a date")
                                .bold()
                        }
                        
                    }.listRowBackground(Color("LightGray"))
                    
                    HStack{
                        
                        Text("Security Code     ") //TextField Title
                            .bold()
                        
                        TextField("Required", text: $securityCode)
                            .keyboardType(.numberPad)
                            
                        
                    }.listRowBackground(Color("LightGray"))
                    
                }
                .scrollContentBackground(.hidden)
                .padding(.top, -25) ///Look for another way to do this
            
                Spacer()
            
        }
        //"Next" button on the top of the screen
        .toolbar {
            NavigationLink(destination: HomeView(modalStates: ModalStates())){
                Text("Next")
            }
            .disabled(securityCode.isEmpty) //The button is gray when securityCode and expirationDate is empty
            .simultaneousGesture(TapGesture().onEnded{
                modalStates.addWalletModalPresented = false
                modalStates.registerCardPresented = false
                modalStates.registerCVVPresented = false
            })
        }
    }
}

struct registerCVVView_Previews: PreviewProvider {
    static var previews: some View {
        registerCVVView(modalStates: ModalStates())
    }
}

