//
//  shotclocktrackerUITests.swift
//  shotclocktrackerUITests
//
//  Created by Philipp Schlaug on 12.06.23.
//

import XCTest

final class ShotclocktrackerUITests: XCTestCase {

    let minusButtonId = "minusSecondButton"
    let addButtonId = "addSecondButton"
    let shotClockTextId = "ShotClock"
    let playPauseButton = "toggleTimerButton"
    let resetTo14ButtonId = "ResetTo14"
    let resetTo24ButtonId = "ResetTo24"
    let backgroundImageId = "BackgroundImage"

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state
        // - such as interface orientation - required for your tests before they run.
        // The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTriggeringTimer() throws {
        let app = XCUIApplication()
        app.launch()
        let shotClockLabel = app.staticTexts[shotClockTextId]
        let toggleTimerButton = app.buttons[playPauseButton]

        let startValue = shotClockLabel.label
        toggleTimerButton.tap()
        sleep(1)
        let endValue = shotClockLabel.label

        XCTAssertNotEqual(startValue, endValue)
    }

    func testSubstractOneSecondAddOneSecondAfterwards() {
        let app = XCUIApplication()
        app.launch()

        let minusButton = app.buttons[minusButtonId]
        let addButton = app.buttons[addButtonId]
        let shotClockText = app.staticTexts[shotClockTextId]
        minusButton.tap()

        XCTAssertEqual(shotClockText.label, "23")
        addButton.tap()
        XCTAssertEqual(shotClockText.label, "24")
    }

    func testRestTo14SecondsButton() {
        let app = XCUIApplication()
        app.launch()

        let resetTo14Button = app.buttons[resetTo14ButtonId]
        let shotClockText = app.staticTexts[shotClockTextId]
        let expectedValue = "14"

        resetTo14Button.tap()

        XCTAssertEqual(shotClockText.label, expectedValue)
    }

    func testRestTo24SecondsButton() {
        let app = XCUIApplication()
        app.launch()

        let resetTo14Button = app.buttons[resetTo14ButtonId]
        let resetTo24Button = app.buttons[resetTo24ButtonId]
        let shotClockText = app.staticTexts[shotClockTextId]
        let expectedValue = "24"

        resetTo14Button.tap()
        // Ensures that it is not the initial value
        XCTAssertEqual(shotClockText.label, "14")
        resetTo24Button.tap()

        XCTAssertEqual(shotClockText.label, expectedValue)
    }

    func testSwipeGestures() {
        let app = XCUIApplication()
        app.launch()
        let shotClockText = app.staticTexts[shotClockTextId]
        let backgroundImage = app.images[backgroundImageId]

        backgroundImage.tap()
        sleep(5)
        XCTAssertNotEqual(shotClockText.label, "24")
        // To stop the timer
        backgroundImage.tap()
        backgroundImage.swipeLeft()
        XCTAssertEqual(shotClockText.label, "14")

        backgroundImage.swipeRight()
        XCTAssertEqual(shotClockText.label, "24")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
