//
//  Home.swift
//  IOS-Wallet-Copycat
//
//  Created by Matheus Barbosa on 23/05/23.
//

import Foundation
import SwiftUI

struct CardsView: View {
    var body: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 0){
                    //Cards
                    ForEach(cards){card in
                        NavigationLink(destination: DetailView(currentCard: card)){
                            CardView(card: card)
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
    }
    
    //Card View
    @ViewBuilder
    func CardView(card: Card) -> some View{
        GeometryReader{proxy in
            
            ZStack(alignment: .bottomLeading){
                
                Image(card.cardImage)
                    .resizable()
                    .scaledToFit()
                    
                
                //Card Details
                VStack(alignment: .leading, spacing: 10){
                    Text(card.cardNumber)
                        .font(.callout)
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                }
                .padding()
                .padding(.bottom,5)
            }
        }
        //Max Size
        .frame(width: 350, height: 220)
        
    }
        
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
    }
}
