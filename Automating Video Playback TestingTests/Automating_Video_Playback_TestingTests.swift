//
//  Automating_Video_Playback_TestingTests.swift
//  Automating Video Playback TestingTests
//
//  Created by Justin Tran on 7/18/25.
//

import XCTest
import AVFoundation
@testable import Automating_Video_Playback_Testing

final class Automating_Video_Playback_TestingTests: XCTestCase {
    
    // Tests whether or not the video loads
    func testPlayerLoadsVideo() {
        guard let url = Bundle.main.url(forResource: "aptVideo", withExtension: "mp4") else {
            XCTFail( "Video file not found" );
            return
        }
        
        let player = AVPlayer(url: url)
        XCTAssertNotNil(player.currentItem, "Player should have valid currentItem")
    }
    
    // Tests whether the video can play
    func testPlayerCanStartPlaying() {
        guard let url = Bundle.main.url(forResource: "aptVideo", withExtension: "mp4") else {
            XCTFail( "Video file not found" );
            return
        }
        
        let player = AVPlayer(url: url)
        let exp = XCTestExpectation(description: "Player should start playing")
        
        player.play()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            if player.rate > 0 {
                exp.fulfill()
            } else {
                XCTFail("Player did not start playing")
            }
        }
        
        wait(for: [exp], timeout: 5)
    }

}
