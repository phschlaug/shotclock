//
//  CustomButtonStyle.swift
//  shotclocktracker
//
//  Created by Philipp Schlaug on 18.06.23.
//

import Foundation
import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .background(.orange)
                .foregroundColor(.white)
                .clipShape(Capsule())
        }
}
