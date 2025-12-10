//
//  ContentView.swift
//  AwesomeApp
//
//  Created by CRUZ, JANAI on 11/21/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message=""
    @State private var imageName=""
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    @State private var lastSoundNumber = -1
    @State private var soundIsOn = true
    @State private var audioPlayer: AVAudioPlayer!
    let numberOfImages = 10 //images labeled image 0-9
    let numberOfSounds = 6 //sounds 0-5
    
    var body: some View {
        
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
                .animation(.easeInOut(duration: 0.15), value: message)
            
            Spacer()
            
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius:30)
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
                
                Button("Show Message"){
                    let messages = ["You Are Awesome!", "You are great!", "You Are Fantastic!", "Fabulous? Thats You!", "You Make Me Smile!", "When The Genius Bar Needs Help, They Call You!","YAY"]
                    
                    lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBound: messages.count-1)
                    message = messages[lastMessageNumber]
                    
                    
                    lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBound: numberOfImages-1)
                    imageName = "image\(lastImageNumber)"
                    
                    
                    lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBound: numberOfSounds-1)
                    if soundIsOn {
                        playSound(soundName: "sound\(lastSoundNumber)")
                    }
                    
                    
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
            }
            
        }
        .padding()
    }
    
    func nonRepeatingRandom(lastNumber: Int, upperBound:Int) -> Int {
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperBound)
        } while newNumber == lastNumber
        return newNumber
        
    }
    
    func playSound(soundName: String) {
        if audioPlayer != nil && audioPlayer.isPlaying {
            audioPlayer.stop()
        }
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("🥀Could not read file named \(soundName)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        }catch {
            print("🥀 ERROR: \(error.localizedDescription) creating audioPlayer")
        }
        
    }
    
}
#Preview() {
    ContentView()
}


