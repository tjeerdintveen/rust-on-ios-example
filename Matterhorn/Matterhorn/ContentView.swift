//
//  ContentView.swift
//  Matterhorn
//
//  Created by Demo on 13/11/2025.
//

import SwiftUI
import Switzerland

struct ContentView: View {
    var body: some View {
        VStack {
            Text(startPlatformWar(chosenSide: .rust).diplomaticMessage)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
