//
//  Register_Card_ModalView.swift
//  IOS-Wallet-Copycat
//
//  Created by Caio Gomes Piteli on 24/05/23.
//


import SwiftUI

struct Register_Card_ModalView: View {
    @Environment(\.presentationMode) var presentation
    @State var name = ""
    @State var cardNumber = ""
    @State var carImage = "CardNU"
    @Binding var isModalOpen: Bool
    @Binding var cards: [Card]
    
    var body: some View {
        let currentCardNumber = cards.count != 0 ? cards[cards.count - 1].cardNumber : ""
        
        VStack {
            Text("Card Details")
                .padding()
                .font(.largeTitle)
                .bold()
            
            Text("Verify and complete your card information.")
                .multilineTextAlignment(.center)
                .frame(width: 350)
                .font(.body)
            
            Form {
                HStack {
                    Text("Name")
                        .bold()
                    
                    TextField("Required", text: $name)
                }
                .listRowBackground(Color("LightGray"))
                
                HStack {
                    Text("Card Number")
                        .bold()
                    
                    TextField("Required", text: $cardNumber)
                        .keyboardType(.numberPad)
                        .onAppear {
                            cardNumber = currentCardNumber
                        }
                }
                .listRowBackground(Color("LightGray"))
            }
            .scrollContentBackground(.hidden)
            .padding(.top, -25)
            
            Spacer()
        }
        .toolbar {
            NavigationLink(destination: registerCVVView(isModalOpen: $isModalOpen, cardNumber: $cardNumber, name: $name, cards: $cards)) {
                Text("Next")
            }
            .disabled(cardNumber.isEmpty || name.isEmpty)
        }
    }
}
