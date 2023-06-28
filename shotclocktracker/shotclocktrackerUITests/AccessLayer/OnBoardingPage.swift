//
//  OnBoardingPage.swift
//  shotclocktrackerUITests
//
//  Created by Philipp Schlaug on 28.06.23.
//

import Foundation
import XCTest

class OnBoardingPage: Page {
    private let gotItButtonId = "GotItButton"

    var gotItButton: XCUIElement {
        return self.application.buttons[self.gotItButtonId]
    }
}
