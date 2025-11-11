//
//  ContentView.swift
//  Matterhorn
//
//  Created by Tjeerd in ‘t Veen on 10/11/2025.
//

import SwiftUI
import Switzerland

struct ContentView: View {
    @State var alliance: PlatformAlliance = startPlatformWar(chosenSide: .rust)
    var body: some View {
        VStack {
            Text("🇨🇭")
            Text(alliance.diplomaticMessage)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
