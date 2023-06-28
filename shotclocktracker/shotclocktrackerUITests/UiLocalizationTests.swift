//
//  UiLocalizationTests.swift
//  shotclocktrackerUITests
//
//  Created by Philipp Schlaug on 22.06.23.
//

import XCTest

final class UiLocalizationTests: XCTestCase {

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

    func testGermanLocalization() throws {
        // This test is a simple check if the german language code gets loaded
        let app = ShotClockApplication()
        app.start(language: .german)
        let expectedText = "Einfache App um die 24 Sekunden in einem Basketballspiel zu messen"
        let gotItButton = app.onBoardingPage.gotItButton
        if gotItButton.isHittable {
            gotItButton.tap()
        }
        let infoButton = app.shotClockPage.informationViewButton
        infoButton.tap()
        let generalInfoText = app.informationPage.generalInformationText
        XCTAssertEqual(generalInfoText.label, expectedText)
    }
}
