//
//  ContentView.swift
//  IOS-Wallet-Copycat
//
//  Created by Gabriel Gandur on 22/05/23.
//

import Foundation
import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView{
                HStack{
                    Text("Wallet")
                        .font(.system(size: 36, weight: .bold))
                        .frame(maxWidth: 270, alignment: .leading)
                    
                    //Botão de adicionar cartão
                    NavigationLink(destination: Text("Rastrear Pacote View")){
                        ZStack{
                            Color(.black)
                                .frame(width: 32, height: 32)
                                .cornerRadius(50)
                            Image(systemName: "shippingbox.fill")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                    
                    //Botão de rastrear pacotes
                    NavigationLink(destination: Text("Adicionar Cartão View")){
                        ZStack{
                            Color(.black)
                                .frame(width: 32, height: 32)
                                .cornerRadius(50)
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                }
                .padding(.top, 32)
                .padding(.bottom, 8)
                VStack{
                    
                    //Só mostra esse card, se ainda não tiver cartões registrados
                    if cards.isEmpty {
                        //Card para adicionar primeiro cartão
                        ZStack{
                            Color("BlueGray")
                                .frame(width: 350, height: 420)
                                .cornerRadius(16)
                            VStack{
                                Text("Get Started With Apple Pay")
                                    .font(.system(size: 32, weight: .semibold))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: 300, alignment: .leading)
                                    .padding(.top, 24)
                                Image("cartoes")
                                    .resizable()
                                    .frame(width: 320, height: 220)
                                    .scaledToFit()
                                ZStack{
                                    Color("BlueGrayStrong")
                                        .frame(width: 350, height: 80)
                                        .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
                                    HStack{
                                        Text("Add a credit or debit card to Wallet.")
                                            .frame(maxWidth: 220, alignment: .leading)
                                            .foregroundColor(.white)
                                        Button {
                                            print("Adicionar cartão pressionado")
                                        } label: {
                                            ZStack{
                                                Color(.white)
                                                    .frame(width: 80, height: 32)
                                                    .cornerRadius(16)
                                                Text("ADD")
                                                    .font(.system(size: 16, weight: .semibold))
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.bottom, -16)
                    }
                    
                    //View que mostra os cartões cadastrados
                    CardsView()
                    
                    //Botão de ver os passes expirados
                    NavigationLink(destination: Text("Expired Passes View")){
                        Text("View 2 Expired Passes")
                            .bold()
                            .font(.system(size: 16))
                            .padding(8)
                            .background(Color("LightGray"))
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
