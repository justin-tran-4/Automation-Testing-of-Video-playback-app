//
//  Automating_Video_Playback_TestingUITests.swift
//  Automating Video Playback TestingUITests
//
//  Created by Justin Tran on 7/18/25.
//

import XCTest

final class Automating_Video_Playback_TestingUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testUnpause() throws {
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let button = app.buttons["toggle"]
        XCTAssertTrue(button.waitForExistence(timeout: 5), "Pause/unpause button is not loading")
        
        // Tap to play
        button.tap()
        sleep(2)
        
        // Tap to pause
        button.tap()
        sleep(2)
        
        // Spamming pause and unpause
        button.doubleTap()
        button.doubleTap()
    }
    
    @MainActor
    func testSkip() throws {
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let skipB = app.buttons["skip"]
        XCTAssertTrue(skipB.waitForExistence(timeout: 5), "Skip button is not loading")
        
        // Skipping once
        skipB.tap()
        sleep(1)
        
        // Spam skipping
        skipB.doubleTap()
        skipB.doubleTap()
        sleep(1)
        
        // Testing if you can skip while the video is paused and unpaused
        let pause = app.buttons["toggle"]
        XCTAssertTrue(pause.waitForExistence(timeout: 5), "Pause/unpause button is not loading")
        
        // Skipping while unpaused
        pause.tap()
        skipB.tap()
        sleep(1)
        
        // Skipping while paused
        pause.tap()
        skipB.tap()

        
    }
    
    @MainActor
    func testRewind() throws {
        let app = XCUIApplication()
        app.launch()
        
        let unpause = app.buttons["toggle"]
        XCTAssertTrue(unpause.waitForExistence(timeout: 5), "Pause/unpause button is not loading")
        
        unpause.tap()
        
        let rewind = app.buttons["rewind"]
        XCTAssertTrue(rewind.waitForExistence(timeout: 5), "Rewind button is not loading")
        
        sleep(10)
        
        // Rewind once while video is unpaused
        rewind.tap()
        sleep(2)
        
        // Spam rewind
        rewind.doubleTap()
        rewind.doubleTap()
        sleep(5)
        
        // Rewind when video is paused
        unpause.tap()
        rewind.tap()
        
        
    }

    @MainActor
    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
