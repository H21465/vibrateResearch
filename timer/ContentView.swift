//  ContentView.swift
//  timer
//
//  Created by YAMAMOTO HAYATO on 2023/05/10.
//
//
import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var isVibrating = false
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            if isVibrating {
                Text("Vibrating")
                    .font(.largeTitle)
            } else {
                Text("Not vibrating")
                    .font(.largeTitle)
            }
            
            Button(action: {
                startVibration()
            }) {
                Text("Start")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .font(.title)
                    .cornerRadius(10)
            }
            .padding()
            
            Button(action: {
                stopVibration()
            }) {
                Text("Stop")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .font(.title)
                    .cornerRadius(10)
            }
            .padding()
        }
        .onReceive(timer) { _ in
            if isVibrating {
                vibrate()
            }
        }
    }
    
    func startVibration() {
        isVibrating = true
    }
    
    func stopVibration() {
        isVibrating = false
    }
    
    func vibrate() {
        // デバイスを振動させる
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.prepare()
        generator.impactOccurred()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
