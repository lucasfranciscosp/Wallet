//
//  ContentView.swift
//  wallet-copycat
//
//  Created by Gabriel Gandur on 26/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var unlocked = false
    @State private var text = "LOCKED"
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("ola mundo!!!")
            Text(text)
                .bold()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
