//
//  ShotClockPage.swift
//  shotclocktrackerUITests
//
//  Created by Philipp Schlaug on 28.06.23.
//

import Foundation
import XCTest

class ShotClockPage: Page {
    private let minusButtonId = "minusSecondButton"
    private let addButtonId = "addSecondButton"
    private let shotClockTextId = "ShotClock"
    private let playPauseButtonId = "toggleTimerButton"
    private let resetTo14ButtonId = "ResetTo14"
    private let resetTo24ButtonId = "ResetTo24"
    private let backgroundImageId = "BackgroundImage"
    private let infoButtonId = "ShowInformationToobarButton"

    var minusButton: XCUIElement {
        return self.application.buttons[self.minusButtonId]
    }

    var addButton: XCUIElement {
        return self.application.buttons[self.addButtonId]
    }

    var playPauseButton: XCUIElement {
        return self.application.buttons[self.playPauseButtonId]
    }

    var resetTo14Button: XCUIElement {
        return self.application.buttons[self.resetTo14ButtonId]
    }

    var resetTo24Button: XCUIElement {
        return self.application.buttons[self.resetTo24ButtonId]
    }

    var informationViewButton: XCUIElement {
        return self.application.buttons[self.infoButtonId]
    }

    var backgroundImage: XCUIElement {
        return self.application.images[self.backgroundImageId]
    }

    var shotClockLabel: XCUIElement {
        return self.application.staticTexts[shotClockTextId]
    }
}
