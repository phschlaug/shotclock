//
//  InformationView.swift
//  shotclocktracker
//
//  Created by Philipp Schlaug on 18.06.23.
//

import SwiftUI

struct Gesture: Identifiable {
    var id = UUID()
    let gesture: String
    let action: String
}

struct InformationView: View {

    @State private var gestures = [
        Gesture(gesture: "Swipe Left", action: "Reset ShotClock to 14"),
        Gesture(gesture: "Swipe Right", action: "Reset ShotClock to 24"),
        Gesture(gesture: "Tap", action: "Toggle Timer")
    ]

    var body: some View {
        Text("Information")
            .font(.headline)
            .padding()
        List {
            Section(header: Text("General")) {
                Text("Simple app to measure the 24 seconds in a basketball game")
            }
            Section(header: Text("Tutorial")) {
                let tutorialText = """
                    Tap to start the timer
                    Swipe Left to reset shotclock to 14
                    Swipe right to reset shotclock to 24
                    """
                Text(.init(tutorialText))
            }
            Section(header: Text("Backgorund Image")) {
                // swiftlint:disable line_length
                let text = """
                    Photo by [Sayan Gosh](https://unsplash.com/@7th_verse?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/s/photos/Basketball-court?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)
                    """
                // swiftlint:enable line_length

                Text(.init(text))
            }
        }
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}
