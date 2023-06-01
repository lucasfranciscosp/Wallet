//
//  Add_to_Wallet_ModalView.swift
//  IOS-Wallet-Copycat
//
//  Created by Caio Gomes Piteli on 23/05/23.
//

import SwiftUI

struct Add_to_Wallet_ModalView: View {
    
    @Environment(\.presentationMode) var presentation //Var in order to use modal
    
    @Binding var isModalOpen: Bool
    @Binding var cards: [Card]
    
    var body: some View {
        
        NavigationView{
            VStack{
                
                HStack{
                    Spacer()
                    
                    //close button
                    Button(action: {
                        presentation.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .renderingMode(.template)
                            .foregroundColor(.gray)
                            .font(.title)
                        
                    })
                    .padding(.trailing, 18)
                    .padding(.top, 15)
                }
                
                Text("Add to wallet")
                    .padding()
                    .font(.largeTitle)
                    .bold()
                
                Text("Keep all the cards, keys, and passes you use every day all in one place.")
                    .multilineTextAlignment(.center)
                    .padding(.trailing, 18)
                    .padding(.leading, 18)
                    .font(.body)
                
                HStack{
                    
                    Text("Available Cards")
                        .font(.title)
                        .bold()
                        .padding(.top, 20)
                        .padding(.leading, 18)
                    
                    Spacer()
                }
                
                
                List {
                    //First button
                    NavigationLink(destination: Register_Card_ModalView(isModalOpen: $isModalOpen, cards: $cards)){
                        HStack{
                            ZStack{
                                Color("LightBlue")
                                    .frame(width: 32, height: 32)
                                    .cornerRadius(6)
                                Image(systemName: "creditcard.fill")
                                    .foregroundColor(.white)
                                    .bold()
                            }
                        }
                        Text(" Debit or Credit Card")
                            .font(.body)
                    }
                    .listRowBackground(Color("LightGray"))
                    
                    //Second button
                    NavigationLink(destination: Register_Card_ModalView(isModalOpen: $isModalOpen, cards: $cards)) {
                        HStack{
                            ZStack{
                                Color("LightGreen")
                                    .frame(width: 32, height: 32)
                                    .cornerRadius(6)
                                Image(systemName: "tram.fill")
                                    .foregroundColor(.white)
                                    .bold()
                            }
                        }
                        Text(" Transit Card")
                            .font(.body)
                    }
                    .listRowBackground(Color("LightGray"))
                    
                    
                }
                .scrollContentBackground(.hidden)
                .padding(.top, -45) //Find a better way to put the list close to the title of the list
                
                Spacer()
            }
        }
    }
}
