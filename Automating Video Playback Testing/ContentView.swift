//
//  ContentView.swift
//  Automating Video Playback Testing
//
//  Created by Justin Tran on 7/18/25.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State private var player = AVPlayer()
    @State private var currentTime: TimeInterval = 0.0
    @State private var duration: TimeInterval = 0.0
    @State private var isFullScreen=false
    @StateObject private var playButton = PauseButton()
    
    var body: some View {
        
        VStack {
            GeometryReader { geometry in
                
                ZStack(alignment: .bottom) {
                    VideoPlayer(player: player)
                        .onAppear {
                            setupPlayer()
                        }
                        .frame(width: isFullScreen ? geometry.size.height :
                                geometry.size.width, height: isFullScreen ?
                               geometry.size.width: geometry.size.height)
                    
                    Spacer()
                    HStack {
                        TimeAdjustButton(direction: .backward, seconds: 5, player: player).accessibilityIdentifier("rewind")

                        Button(action:  {
                            playButton.togglePlayback(player: player)
                        }) {
                            Image(systemName:playButton.isPlaying ? "pause.circle" : "play.circle")
                                .foregroundColor(.blue)
                                .imageScale(.large)
                                .padding()
                        }.accessibilityIdentifier("toggle")
                        
                        TimeAdjustButton(direction: .forward, seconds: 5, player: player).accessibilityIdentifier("skip")
                    }
                }
            }
            
            
        }
        
    }
    
    func setupPlayer() {
        guard let videoURL = Bundle.main.url(forResource: "aptVideo", withExtension: "mp4") else { return }
        
        player.replaceCurrentItem(with: AVPlayerItem(url: videoURL))

    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
