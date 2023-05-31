//
//  DetailView.swift
//  wallet-copycat
//
//  Created by Matheus Barbosa on 30/05/23.
//

import SwiftUI
// Detail View
struct DetailView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    var currentCard: Card
    var body: some View {
            ZStack {
                VStack{
                    ScrollView{
                    VStack{
                        CardView()
                            .frame(height: 220)
                            .padding(.top, 20)
                            .shadow(radius: 7)
                        ScrollView{
                            VStack(alignment: .leading) {
                                
                                Text("Latest Transactions")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .padding()
                                    .padding(.bottom, -50)
                                                                
                                List {
                                        ForEach(details){ detail in
                                            // Card View
                                            NavigationLink(destination: Text("Destino")){
                                                VStack(alignment: .leading){
                                                    DetailCardView(detail: detail)
                                                }
                                            }
                                    }
                                    .listRowBackground(Color("LightGray"))
                                }
                                .frame(height: 500)
                                .scrollContentBackground(.hidden)
                                
                                .toolbar(content: {
                                           ToolbarItem (placement: .navigationBarLeading)  {
                                                    
                                               Button(action: {
                                                   presentationMode.wrappedValue.dismiss()
                                               }, label: {
                                                   Text("Done")
                                                       .fontWeight(.semibold)
                                                       .foregroundColor(.black)
                                               })
                                           }
                                    
                                    ToolbarItem (placement: .navigationBarTrailing)  {
                                        Button(action: {
                                            
                                        }, label: {
                                            Image(systemName: "ellipsis.circle")
                                                .foregroundColor(.black)
                                                
                                        })
                                    }
          
                                           })
                            }
                        }
                    }
                }
                    .scrollIndicators(.hidden)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .navigationBarBackButtonHidden(true)
            }
        }
        }
    
    
    @ViewBuilder
    func CardView() -> some View{
        ZStack(alignment: .leading){
            Image(currentCard.cardImage)
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
                    Text(customCardNumber(number: currentCard.cardNumber))
                        .font(.callout)
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                }.padding(.top, 175)
            }
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
}

struct DetailCardView: View{
    var detail: Detail
    
    var body: some View {
        HStack {
            HStack{
                Text(detail.place)
                    .fontWeight(.bold)
                Spacer()
                Text(detail.price)
            }
        }
        Text(detail.gps)
        Text(detail.hours)
        }
    }

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(currentCard: Card(name: "Qualquer", cardNumber: "1234 5678 9102 44950", cardImage: "CardNU"))
    }
}
