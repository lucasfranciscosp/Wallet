//
//  DetailView.swift
//  wallet-copycat
//
//  Created by Matheus Barbosa on 30/05/23.
//

import SwiftUI
// Detail View
struct DetailView: View {
    var currentCard: Card
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("Done")
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Image(systemName: "ellipsis.circle")
                        .font(.title3)
                }.padding()
                
                VStack(alignment: .leading){
                    CardView()
                        .frame(height: 220)
                    
                    Text("Latest Transactions")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                }
                
                VStack {
                    List {
                        //First button
                        NavigationLink(destination: Text("Destino")){
                            VStack(alignment: .leading){
                                HStack {
                                    Text("Lsmfoodsltd********al")
                                        .fontWeight(.bold)
    
                                    Spacer()
                                    Text("R$ 16,80")
                                }
                                Text("Campinas, SP")
                                Text("10 minutes ago")
                            }
                            
                        }
                        .listRowBackground(Color("LightGray"))
                        
//                        //Second button
//                        NavigationLink(destination: Text("Destino")) {
//                            HStack{
//                                ZStack{
//                                    Color("LightGreen")
//                                        .frame(width: 32, height: 32)
//                                        .cornerRadius(6)
//                                    Image(systemName: "tram.fill")
//                                        .foregroundColor(.white)
//                                        .bold()
//                                }
//                            }
//                            Text(" Transit Card")
//                                .font(.body)
//                        }
//                        .listRowBackground(Color("LightGray"))
                        
                        
                    }
                    .scrollContentBackground(.hidden)
                .padding(.top, -45)
                } //Find a better way to put the list close to the title of the list
                
            }
        }
    }
    
    @ViewBuilder
    func CardView() -> some View{
        ZStack{
            Image(currentCard.cardImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            //Details
            VStack(alignment: .leading, spacing: 10){
                Text(currentCard.cardNumber)
                    .font(.callout)
                    .fontWeight(.regular)
                    .foregroundColor(.white)
            }
            .padding()
            .padding(.bottom, 10)
            .foregroundColor(.white)
        }
    }
}


//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(currentCard:)
//    }
//}
