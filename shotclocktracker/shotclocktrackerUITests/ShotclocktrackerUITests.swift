//
//  shotclocktrackerUITests.swift
//  shotclocktrackerUITests
//
//  Created by Philipp Schlaug on 12.06.23.
//

import XCTest

final class ShotclocktrackerUITests: XCTestCase {
    public var application: ShotClockApplication!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state
        // - such as interface orientation - required for your tests before they run.
        // The setUp method is a good place to do this.
        application = ShotClockApplication()
        application.start()
        let onBoardingButton = application.onBoardingPage.gotItButton
        if onBoardingButton.isHittable {
            onBoardingButton.tap()
        } else {
            print("Something went wrong")
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTriggeringTimer() throws {
        let shotClockLabel = application.shotClockPage.shotClockLabel
        let toggleTimerButton = application.shotClockPage.playPauseButton

        let startValue = shotClockLabel.label
        toggleTimerButton.tap()
        sleep(1)
        let endValue = shotClockLabel.label

        XCTAssertNotEqual(startValue, endValue)
    }

    func testSubstractOneSecondAddOneSecondAfterwards() {
        let minusButton = application.shotClockPage.minusButton
        let addButton = application.shotClockPage.addButton
        let shotClockText = application.shotClockPage.shotClockLabel
        minusButton.tap()

        XCTAssertEqual(shotClockText.label, "23")
        addButton.tap()
        XCTAssertEqual(shotClockText.label, "24")
    }

    func testRestTo14SecondsButton() {
        let resetTo14Button = application.shotClockPage.resetTo14Button
        let shotClockText = application.shotClockPage.shotClockLabel
        let expectedValue = "14"

        resetTo14Button.tap()

        XCTAssertEqual(shotClockText.label, expectedValue)
    }

    func testRestTo24SecondsButton() {
        let resetTo14Button = application.shotClockPage.resetTo14Button
        let resetTo24Button = application.shotClockPage.resetTo24Button
        let shotClockText = application.shotClockPage.shotClockLabel
        let expectedValue = "24"

        resetTo14Button.tap()
        // Ensures that it is not the initial value
        XCTAssertEqual(shotClockText.label, "14")
        resetTo24Button.tap()

        XCTAssertEqual(shotClockText.label, expectedValue)
    }

    func testSwipeGestures() {
        let shotClockText = application.shotClockPage.shotClockLabel
        let backgroundImage = application.shotClockPage.backgroundImage

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

    func testOpenInformationView() {
        let informationViewAppIcon = application.informationPage.appIcon
        let informationViewButton = application.shotClockPage.informationViewButton
        informationViewButton.tap()
        XCTAssertTrue(informationViewAppIcon.isHittable)
    }
}
