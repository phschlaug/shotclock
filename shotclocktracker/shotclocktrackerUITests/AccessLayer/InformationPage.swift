//
//  InformationPage.swift
//  shotclocktrackerUITests
//
//  Created by Philipp Schlaug on 28.06.23.
//

import Foundation
import XCTest

class InformationPage: Page {
    private let appIconImageId = "AppIconImage"
    private let generalTextId = "GeneralText"

    var appIcon: XCUIElement {
        return self.application.images[self.appIconImageId]
    }

    var generalInformationText: XCUIElement {
        return self.application.staticTexts[self.generalTextId]
    }
}
