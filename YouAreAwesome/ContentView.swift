//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Matthew Peterson on 7/9/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = "I am a programmer!"
    var body: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()                .foregroundStyle(.orange)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.red)
            Button("Button") {
                message = "You pressed the button!"
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
