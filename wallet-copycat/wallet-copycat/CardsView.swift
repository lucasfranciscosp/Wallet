//
//  Home.swift
//  IOS-Wallet-Copycat
//
//  Created by Matheus Barbosa on 23/05/23.
//
import SwiftUI

struct CardsView: View {
    // Detail View Properties
    @State var currentCard: Card?
    @State var showDetailCard: Bool = false
    @Namespace var animation
    
    var body: some View{
        VStack{
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 0){
                    ForEach(cards){card in
                        NavigationLink(destination: DetailView(currentCard: card)){
                            CardView(card: card)
                        }
                    }
                }
            }
            .coordinateSpace(name: "SCROOL")
        }
        .padding(.horizontal)
    }
    
    //Card View
    @ViewBuilder
    func CardView(card: Card) -> some View{
        GeometryReader{proxy in
            
            let rect = proxy.frame(in: .named("SCROOL"))
            //Display some Portion of each Card
            let offset = -rect.minY + CGFloat(getIndex(Card: card) * 55)
            
            ZStack(alignment: .leading){
                Image(card.cardImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                //Details
                VStack(alignment: .leading){
                    HStack{
                        Text("﹒﹒﹒﹒﹒")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .tracking(-20)
                        Text(customCardNumber(number: card.cardNumber))
                            .font(.callout)
                            .fontWeight(.regular)
                            .foregroundColor(.white)
                    }.padding(.top, 175)
                }
            }
            // Max Size
            .offset(y: offset)
            
        }// Max Size
        .frame(height: 220)
    }
    
    //Retreiving Index
    func getIndex(Card: Card) -> Int{
        return cards.firstIndex { currentCard in
            return currentCard.id == Card.id
        } ?? 0
    }
}

//Hiding numbers
func customCardNumber(number: String) -> String{
    var newValue: String = ""
    let maxCount = number.count - 4
    
    number.enumerated().forEach{value in
        if value.offset >= maxCount{
            //displaying text
            let string = String(value.element)
            newValue.append(contentsOf: string)
        }
        else{
            //Displaying star
            //Avoiding space
            let string = String(value.element)
            if string == " " {
                newValue.append(contentsOf: "")
            }else{
                newValue.append(contentsOf: "")
            }
        }
    }
    
    return newValue
}

struct Cards_View: PreviewProvider {
    static var previews: some View {
        CardsView()
    }
}

