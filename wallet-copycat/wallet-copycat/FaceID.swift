//
//  FaceID.swift
//  IOS-Wallet-Copycat
//
//  Created by Lucas Francisco on 24/05/23.
//

import Foundation
import SwiftUI
import LocalAuthentication

func  authenticate() async -> String {
    let context = LAContext()
    var error: NSError?
    
    if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
        
        return try await withCheckedContinuation{ continuation in
            context.evaluatePolicy(.deviceOwnerAuthentication,
                                   localizedReason: "This is for security reasons") { success, authenticationError in
                if success {
                    continuation.resume(returning: "UNLOCKED")
                } else {
                    continuation.resume(returning: "There was a problem")
                }
            }
        }
        
    } else {
        // Abrir numpad para colocar senha
        return "Phone does not have biometrics"
    }
}
