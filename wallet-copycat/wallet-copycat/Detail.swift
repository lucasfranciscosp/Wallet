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
