//
//  ContentView.swift
//  Speech Practice
//
//  Created by Wonil Lee on 10/3/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var oo = ContentViewObservable()
    
    var body: some View {
        VStack {
            Image(systemName: "ear")
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
                .foregroundStyle(.ear)
            Spacer()
                .frame(height: 20)
            Text("Speech To Text")
                .font(.title2)
                 Text("On-Device, ko_KR")
            
            Divider()
            
            Spacer()
                .frame(height: 20)
                Text("💬" + " " + oo.transcribedStringPub)
                    .font(.title3)
                    .frame(height: 200)
            Spacer()
                .frame(height: 20)
            Button {
                oo.invalidateButton()
                do {
                    try oo.startRecording()
                } catch {
                    print("error while recording: \(error.localizedDescription)")
                }
            } label: {
                Text("Record & Transcribe")
                    .padding(7)
            }
            .buttonStyle(.borderedProminent)
            .foregroundStyle(.same)
            .tint(.recordButtonTint)
            .disabled(oo.buttonPressed)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
