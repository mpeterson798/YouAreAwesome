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
    @State private var lastSoundNumber = -1
    @State private var soundIsOn = true
    
    
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
            
            
            HStack {
                
                Text("Sound On:")
                Toggle("", isOn: $soundIsOn)
                    .labelsHidden()
                    .onChange(of: soundIsOn) {
                        if audioPlayer != nil && audioPlayer.isPlaying {
                            audioPlayer.stop()
                        }
                    }
                    
                
                
                Spacer()
                
                Button("Show Message") {
                    
                    let messages = ["You are awesome!",
                                    "When the Genius bar needs help, they call you!",
                                    "You are great!",
                                    "You are incredible!",
                                    "You are cool!",
                                    "You're amazing!"]
                    
                    
                    
                    lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBounds: messages.count)
                    
                    message = messages[lastMessageNumber]
                    
                    
                    
                    
                    lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBounds: numberOfImages)
                    
                    imageName = "image\(lastImageNumber)"
                    
                    
                    
                    
                    lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBounds: numberOfSounds)
                    
                    if soundIsOn {
                        playSound(soundName: "sound\(lastSoundNumber)")
                    }
                    
                    
                    
                    
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
                
            }
        }
        .padding()
        .tint(.accentColor)
    }
    
    func playSound(soundName: String) {
        if audioPlayer != nil && audioPlayer.isPlaying {
            audioPlayer.stop()
        }
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
    
    func nonRepeatingRandom(lastNumber: Int, upperBounds: Int) -> Int {
        var number: Int
        repeat {
            number = Int.random(in: 0..<upperBounds)
        } while number == lastNumber
        return number
    }
}

#Preview ("Light Mode") {
    ContentView()
        .preferredColorScheme(.light)
}
#Preview ("Dark Mode") {
    ContentView()
        .preferredColorScheme(.dark)
}
