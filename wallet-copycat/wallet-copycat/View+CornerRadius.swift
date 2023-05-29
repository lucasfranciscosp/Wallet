//
//  View+CornerRadius.swift
//  IOS-Wallet-Copycat
//
//  Created by Gabriel Gandur on 24/05/23.
//

import Foundation
import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
