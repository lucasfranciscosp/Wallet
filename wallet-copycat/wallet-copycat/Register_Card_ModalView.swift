//
//  Register_Card_ModalView.swift
//  IOS-Wallet-Copycat
//
//  Created by Caio Gomes Piteli on 24/05/23.
//

//


import SwiftUI

struct Register_Card_ModalView: View {
    
    @State var name = ""
    @State var cardNumber = ""
    @State var carImage = "CardNU"
    
    @ObservedObject var modalStates: ModalStates
    
    var body: some View {
        VStack{
                
                Text("Card Details")
                    .padding()
                    .font(.largeTitle)
                    .bold()
                
                Text("Verify and complete your card information.")
                    .multilineTextAlignment(.center)
                    .frame(width: 350)
                    .font(.body)
                
                Form{
                    HStack{
                        Text("Name                    ")//TextField Title
                            .bold()
                        
                        TextField("Required", text: $name)
                        
                    }.listRowBackground(Color("LightGray"))
                    
                    HStack{
                        Text("Card Number     ") //TextField Title
                            .bold()
                        
                        TextField("Required", text: $cardNumber)
                            .keyboardType(.numberPad)
                            
                    }.listRowBackground(Color("LightGray"))
                    
                }
                .scrollContentBackground(.hidden)
                .padding(.top, -25) ///Look for another way to do this
            
                Spacer()
            
        }
        //"Next" button on the top of the screen
        .toolbar {
            NavigationLink(destination: registerCVVView(modalStates: ModalStates())){
                Text("Next")
            }
            .disabled(cardNumber.isEmpty) //The button is gray when cardnumber is empty
            .simultaneousGesture(TapGesture().onEnded{
                modalStates.registerCVVPresented = true
            })
        }
    }

}



struct Register_Card_ModalView_Previews: PreviewProvider {
    static var previews: some View {
        Register_Card_ModalView(modalStates: ModalStates())
    }
}
