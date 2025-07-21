//
//  PauseButton.swift
//  Automating Video Playback Testing
//
//  Created by Justin Tran on 7/19/25.
//

import SwiftUI
import AVFoundation

class PauseButton: ObservableObject {
    @Published var isPlaying = false
    
    func togglePlayback(player: AVPlayer) {
        if isPlaying {
            player.pause()
        } else {
            player.play()
        }
        isPlaying.toggle()
    }
}
