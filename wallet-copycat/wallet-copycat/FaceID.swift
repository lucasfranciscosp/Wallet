//
//  FaceID.swift
//  IOS-Wallet-Copycat
//
//  Created by Lucas Francisco on 24/05/23.
//

import Foundation
import SwiftUI
import LocalAuthentication

func  authenticate() async -> Int {
    let context = LAContext()
    var error: NSError?
    
    if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
        
        return try await withCheckedContinuation{ continuation in
            context.evaluatePolicy(.deviceOwnerAuthentication,
                                   localizedReason: "This is for security reasons") { success, authenticationError in
                if success {
                    continuation.resume(returning: 1)
                } else {
                    continuation.resume(returning: 0)
                }
            }
        }
        
    } else {
        // Abrir numpad para colocar senha
        return -1
        //return "Phone does not have biometrics"
    }
}
