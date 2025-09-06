//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Matthew Peterson on 7/9/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    var body: some View {
        
        VStack {
            
            Spacer()
            
            
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
                
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            
            Spacer()
            
            
            Button("Press Me!") {
                let message1 = "You are awesome!"
                let message2 = "You are great!"
                
                let imageName1 = "sun.max.fill"
                let imageName2 = "hand.thumbsup"
                
                if message == message1 {
                    message = message2
                    imageName = imageName1
                }
                else {
                    message = message1
                    imageName = imageName2
                }
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.orange)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
