//
//  ContentView.swift
//  AwesomeApp
//
//  Created by CRUZ, JANAI on 11/21/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message=""
    @State private var imageName=""
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    
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
            
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius:30)
                .animation(.default, value: imageName)
            
            Spacer()
            
            Button("Show Message"){
                let messages = ["You Are Awesome!", "You are great!", "You Are Fantastic!", "Fabulous? Thats You!", "You Make Me Smile!", "When The Genius Bar Needs Help, They Call You!","YAY"]
                
                var messageNumber = Int.random(in: 0...messages.count-1)
                while messageNumber == lastMessageNumber{
                    messageNumber = Int.random(in: 0...messages.count-1)
                }
                message = messages[messageNumber]
                lastMessageNumber = messageNumber
                
                var imageNumber = Int.random(in: 0...9)
                while imageNumber == lastImageNumber{
                    imageNumber = Int.random(in: 0...9)
                }
                imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
                
                            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            
        }
        .padding()
    }
    
}
#Preview() {
    ContentView()
}

//this is a test
