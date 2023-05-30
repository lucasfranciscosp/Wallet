//
//  Card.swift
//  IOS-Wallet-Copycat
//
//  Created by Matheus Barbosa on 23/05/23.
//

import Foundation
import SwiftUI

//Sample Card Model and Data
struct Card: Identifiable {
    var id = UUID().uuidString
    var name: String
    var cardNumber: String
    var cardImage: String
}

var cards: [Card] = [
    Card(name: "Caio P", cardNumber: "5423 1234 8950 0986", cardImage: "CardNU"),
    Card(name: "Caio P", cardNumber: "0000 0000 0000 0000", cardImage: "CardNU"),
    Card(name: "Caio P", cardNumber: "5423 1234 8950 7777", cardImage: "CardNU")
]
