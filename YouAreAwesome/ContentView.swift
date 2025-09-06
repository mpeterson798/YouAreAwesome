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
    @State private var imageNumber = 0
    
    
    @State private var messageNumber = 0
    
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            
            Button("Show Message") {
                
                let messages = ["You are awesome!",
                                               "You are great!",
                                               "You are incredible!",
                                               "You are cool!",
                                               "You're amazing!"]
                
                if messageNumber < messages.count - 1 {
                    messageNumber += 1
                }
                else {
                    messageNumber = 0
                }
                
                message = messages[messageNumber]
                
//                message = (message == message1 ? message2 : message1)
                
                //                imageName = (imageName == imageName1 ? imageName2 : imageName1)

                
                imageName = "image\(imageNumber)"
                
                imageNumber += 1
                
                if imageNumber > 9 {
                    imageNumber = 0
                }
                
                
                
                
                
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
