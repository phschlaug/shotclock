//
//  InformationView.swift
//  shotclocktracker
//
//  Created by Philipp Schlaug on 18.06.23.
//

import SwiftUI

struct InformationView: View {

    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String

    var body: some View {
        Text("Information")
            .font(.headline)
            .padding()
        List {
            Section {
                VStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .accessibilityIdentifier("AppIconImage")

                    Text("Version: \(appVersion ?? "n/a")")
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 150)
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.clear)
            }
            Section(header: Text(NSLocalizedString("GeneralHeader", comment: "Information View"))) {
                Text(NSLocalizedString("GeneralText", comment: "Information View"))
                    .accessibilityIdentifier("GeneralText")
            }
            Section(header: Text("Tutorial")) {
                let tapText = NSLocalizedString("TapText", comment: "On Boarding View")
                let swipeRightText = NSLocalizedString("SwipeRightText", comment: "On Boarding View")
                let swipeLeftText = NSLocalizedString("SwipeLeftText", comment: "On Boarding View")
                let tutorialText = "\(tapText)\n\(swipeLeftText)\n\(swipeRightText)"
                Text(.init(tutorialText))
            }
            Section(header: Text(NSLocalizedString("BackgroundImageHeader", comment: "Information View"))) {
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
