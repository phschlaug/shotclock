//
//  OnBoardingView.swift
//  shotclocktracker
//
//  Created by Philipp Schlaug on 21.06.23.
//

import SwiftUI

struct OnBoardingView: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool?

    let color = Color(.white)
    var body: some View {
        VStack {
            Text("Features:")
                .font(.system(size: 30))
                .foregroundColor(color)
            VStack(alignment: .center) {
                HStack {
                    Image(systemName: "hand.point.left")
                        .font(.system(size: 60))
                    Divider()
                    let swipeLeftText = NSLocalizedString("SwipeLeftText", comment: "On Boarding View")
                    Text(swipeLeftText)
                        .font(.system(size: 30))
                        .fixedSize(horizontal: false, vertical: true)
                }
                HStack {
                    Image(systemName: "hand.point.right")
                        .font(.system(size: 60))
                    Divider()
                    let swipeRightText = NSLocalizedString("SwipeRightText", comment: "On Boarding View")
                    Text(swipeRightText)
                        .font(.system(size: 30))
                        .fixedSize(horizontal: false, vertical: true)
                }
                HStack {
                    Image(systemName: "hand.tap")
                        .font(.system(size: 60))
                    Divider()
                    let tapText = NSLocalizedString("TapText", comment: "On Boarding View")
                    Text(tapText)
                        .font(.system(size: 30))
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .foregroundColor(color)
            Button {
                isOnboarding = false
            }label: {
                let text = NSLocalizedString("GotIt", comment: "On Boarding View")
                Text(text)
            }
            .accessibilityIdentifier("GotItButton")
            .padding()
            .buttonStyle(CustomButtonStyle())
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .background {
            Image("basketball_court")
                .resizable()
                .opacity(1.0)
                .contrast(0.5)
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
