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
            let offset = -rect.minY + CGFloat(getIndex(Card: card) * 70)
            ZStack{
                Image(card.cardImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                //Details
                VStack(){
                    Text(customCardNumber(number: card.cardNumber))
                        .font(.callout)
                        .fontWeight(.semibold)
                }
                .padding(.top, 145)
                .padding(.trailing, 130)
                .foregroundColor(.white)
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
                newValue.append(contentsOf: " ")
            }else{
                newValue.append(contentsOf: "*")
            }
        }
    }
    
    return newValue
}

// Detail View
struct DetailView: View {
    var currentCard: Card
    @Binding var showDetailCard: Bool
    
    // Delaying Expenses View
    @State var showExpensesView: Bool = false
    
    //Matched Geometry Effect
    var animation: Namespace.ID
    
    
    var body: some View {
        ZStack {
            VStack{
                HStack{
                    Text("Done")
                        .font(.callout)
                        .fontWeight(.semibold)
                            
                    Spacer()
                    Image(systemName: "ellipsis.circle")
                    
                }.padding()
                
                CardView()
                    .matchedGeometryEffect(id: currentCard.id, in: animation)
                    .frame(height: 220)
                    .onTapGesture {
                        // Closing Expenses View First
                        withAnimation(.easeInOut){
                            showExpensesView = false
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            withAnimation(.easeInOut(duration: 0.35)){
                                showDetailCard = false
                            }
                        }
                    }
                    .zIndex(10)
                
                GeometryReader{proxy in
                    let height = proxy.size.height - 450
                    
                    ScrollView(.vertical, showsIndicators: false){
                        
                        VStack(alignment: .leading){
                            Text("Latest Transactions")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .offset(y: showExpensesView ? 0 : height)
                }
                .padding([.horizontal, .top])
                .zIndex(-10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .onAppear{
                withAnimation(.easeInOut.delay(0.1)){
                    showExpensesView = false
                }
        }
        }.background(.white)
    }
    
    @ViewBuilder
    func CardView() -> some View{
        ZStack{
            Image(currentCard.cardImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            //Details
            VStack(alignment: .leading, spacing: 10){
                Text(customCardNumber(number: currentCard.cardNumber))
                    .font(.callout)
                    .fontWeight(.semibold)
            }
            .padding(.top, 145)
            .padding(.trailing, 130)
            .foregroundColor(.white)
        }
    }
}

struct Cards_View: PreviewProvider {
    static var previews: some View {
        CardsView()
    }
}

