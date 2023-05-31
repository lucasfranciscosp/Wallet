//
//  registerCVVView.swift
//  IOS-Wallet-Copycat
//
//  Created by Caio Gomes Piteli on 25/05/23.
//

import SwiftUI

struct registerCVVView: View {
    
    @Environment(\.presentationMode) var presentation //Var in order to use modal
    
    @State var expirationDate = Date.now
    @State var securityCode = ""
    @Binding var isModalOpen: Bool
    @Binding var cardNumber: String
    @Binding var name: String
    @Binding var cards: [Card]
    
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
            Button("Next") {
                isModalOpen = false
                if cards.count.isMultiple(of: 2){
                    cards.append(Card(name: name, cardNumber: cardNumber, cardImage: "CardNU"))
                } else {
                    cards.append(Card(name: name, cardNumber: cardNumber, cardImage: "CardBB"))
                }
            }
            .disabled(securityCode.isEmpty) //The button is gray when securityCode and expirationDate is empty
        }
    }
}
