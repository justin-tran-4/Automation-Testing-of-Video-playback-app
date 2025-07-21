//
//  AdjustButton.swift
//  Automating Video Playback Testing
//
//  Created by Justin Tran on 7/19/25.
//

import SwiftUI
import AVFoundation

struct TimeAdjustButton: View {
    let direction: SkipDirection
    let seconds: Double
    let player: AVPlayer
    
    enum SkipDirection {
        case forward, backward
    }
    
    var body: some View {
        Button(action: {
            direction == .forward ? skip() : rewind()
        }) {
            Image(systemName: direction == .forward ? "forward.fill" : "backward.fill")
        }.padding().accessibilityIdentifier(direction == .forward ? "skipButton" : "rewindButton")

    }
    
    func skip() {
        let currTime = player.currentTime()
        let skipSec = CMTime(seconds: seconds, preferredTimescale: 600)
        let newTime = CMTimeAdd(currTime, skipSec)
        player.seek(to: newTime)
    }

    func rewind() {
        let currTime = player.currentTime()
        let skipSec = CMTime(seconds: seconds, preferredTimescale: 600)
        let newTime = CMTimeSubtract(currTime, skipSec)
        player.seek(to: newTime)
    }
    
    
}
