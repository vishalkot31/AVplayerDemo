//
//  ContentView.swift
//  AVplayerDemo
//
//  Created by Vishal Kothari on 20/12/25.
//

import SwiftUI
import AVKit

struct ContentView: View {
    
    @State private var playerVM = PlayerViewModel()
    
    var body: some View {
        VStack {
            VideoPlayer(player: playerVM.player)
                .frame(height:300)
                .cornerRadius(10)
            
            HStack(spacing:30){
                Button {
                    playerVM.togglePlayPause()
                } label: {
                    Image(systemName: playerVM.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                        .resizable()
                        .frame(width: 50,height: 50)
                }

            }.padding()
        }
        .onAppear {
            playerVM.seUpPlayer()
        }
    }
}

#Preview {
    ContentView()
}
