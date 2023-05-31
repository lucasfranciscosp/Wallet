//
//  Detail.swift
//  wallet-copycat
//
//  Created by Matheus Barbosa on 30/05/23.
//

import SwiftUI
struct Detail: Identifiable{
    var id = UUID().uuidString
    var price: String
    var place: String
    var gps: String
    var hours: String
}

var details: [Detail] = [
    Detail(price: "R$ 16,80", place: "Lsmfoodsltda*******al", gps: "Campinas", hours: "12 hours ago"),
//    Detail(price: "R$ 2,00", place: "Lsmfoodsltda*******al", gps: "Buzios", hours: "02 hours ago"),
//    Detail(price: "R$ 50.000,00", place: "LSeilaLoja*******al", gps: "Nova Odessa", hours: "777 hours ago")
]

