//
//  ModalControl.swift
//  IOS-Wallet-Copycat
//
//  Created by Caio Gomes Piteli on 29/05/23.
//

import Foundation

class ModalStates: ObservableObject {
    @Published var addWalletModalPresented: Bool = false
    @Published var registerCardPresented: Bool = false
    @Published var registerCVVPresented: Bool = false
}

