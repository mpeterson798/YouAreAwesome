//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Matthew Peterson on 7/9/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    
    
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastImageNumber = -1
    @State private var lastMessageNumber = -1
    let numberOfImages = 10
    let numberOfSounds = 6
    @State private var audioPlayer: AVAudioPlayer!
    @State private var soundName = ""
    @State private var lastSoundNumber = -1
    
    
    var body: some View {
        
        VStack {
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
                .animation(.easeIn(duration: 0.15), value: message)
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            
            Spacer()
            
            
            Button("Show Message") {
                
                let messages = ["You are awesome!",
                                "When the Genius bar needs help, they call you!",
                                "You are great!",
                                "You are incredible!",
                                "You are cool!",
                                "You're amazing!"]
                

                
                var messageNumber:Int
                
                repeat {
                    messageNumber = Int.random(in: 0..<messages.count)
                } while messageNumber == lastMessageNumber
                
                message = messages[messageNumber]
                lastMessageNumber = messageNumber

                
                
                
                var imageNumber:Int
                
                repeat{
                    imageNumber = Int.random(in: 0..<numberOfImages)
                } while imageNumber == lastImageNumber
                
                imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
                
                
                
                
                var soundNumber:Int
                
                repeat {
                    soundNumber = Int.random(in: 0..<numberOfSounds)
                } while soundNumber == lastSoundNumber
                
                soundName = "sound\(soundNumber)"
                lastSoundNumber = soundNumber
                
                guard let soundFile = NSDataAsset(name: soundName) else {
                    print("😡Could not read file named \(soundName)")
                    return
                }
                do {
                    audioPlayer = try AVAudioPlayer(data: soundFile.data)
                    audioPlayer.play()
                } catch {
                    print("😡ERROR: \(error.localizedDescription) creating audioPlayer")
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
