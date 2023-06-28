//
//  Page.swift
//  shotclocktrackerUITests
//
//  Created by Philipp Schlaug on 27.06.23.
//

import Foundation
import XCTest

enum Language {
    case english
    case german
}

/// Abstraction of the Main App
class ShotClockApplication {
    let application = XCUIApplication()
    var onBoardingPage: OnBoardingPage {
        return OnBoardingPage(application: self.application)
    }
    var shotClockPage: ShotClockPage {
        return ShotClockPage(application: self.application)
    }
    var informationPage: InformationPage {
        return InformationPage(application: self.application)
    }

    public func start(language: Language = Language.english) {
        if language == Language.german {
            self.application.launchArguments += ["-AppleLanguages", "(de)"]
            self.application.launchArguments += ["-AppleLocale", "de_DE"]
        }
        self.application.launch()
    }
}
