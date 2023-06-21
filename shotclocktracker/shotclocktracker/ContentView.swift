//
//  ContentView.swift
//  shotclocktracker
//
//  Created by Philipp Schlaug on 12.06.23.
//

import SwiftUI
import AudioToolbox
import UIKit

struct ContentView: View {
    @State var shotClockValue: Int = 24
    @State var isRunning = false
    @State var showInfomrationView = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    // List of system sounds https://iphonedev.wiki/index.php/AudioServices
    let calendarAlertSound: SystemSoundID = 1005
    let failedUnlockSoundId: SystemSoundID = 1102

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button {
                        if self.shotClockValue == 24 {
                            AudioServicesPlaySystemSound(failedUnlockSoundId)
                        }
                        if self.shotClockValue < 24 {
                            shotClockValue += 1
                        }

                    } label: {
                        Label(NSLocalizedString("SecAbriviation", comment: "Main View"), systemImage: "plus.circle")
                    }
                    .accessibilityIdentifier("addSecondButton")
                    .buttonStyle(CustomButtonStyle())

                    Spacer()

                    Button {
                        if self.shotClockValue > 0 {
                            shotClockValue -= 1
                        }
                    }label: {
                        Label(NSLocalizedString("SecAbriviation", comment: "Main View"), systemImage: "minus.circle")
                    }
                    .accessibilityIdentifier("minusSecondButton")
                    .buttonStyle(CustomButtonStyle())
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)

                Text("\(shotClockValue)")
                    .accessibilityIdentifier("ShotClock")
                    .foregroundColor(.white)
                    .padding()
                    .onReceive(timer) { _ in
                        if self.shotClockValue == 0 {
                            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
                            AudioServicesPlaySystemSound(calendarAlertSound)
                        }
                        if self.shotClockValue > 0 && self.isRunning {
                            self.shotClockValue -= 1
                        } else {
                            self.isRunning = false
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .font(.system(size: 200, weight: .bold))
                HStack {
                    Button("14") {
                        self.shotClockValue = 14
                    }
                    .accessibilityIdentifier("ResetTo14")
                    .buttonStyle(CustomButtonStyle())

                    Spacer()

                    Button {
                        self.isRunning.toggle()
                    }label: {
                        Image(systemName: self.isRunning ? "pause.circle" : "play.circle")
                            .imageScale(.large)
                            .frame(maxWidth: .infinity)
                    }
                    .accessibilityIdentifier("toggleTimerButton")
                    .buttonStyle(CustomButtonStyle())
                    Spacer()

                    Button("24") {
                        self.shotClockValue = 24
                    }
                    .accessibilityIdentifier("ResetTo24")
                    .buttonStyle(CustomButtonStyle())
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.showInfomrationView.toggle()
                    }label: {
                        Label("ShowInfomration", systemImage: "info.circle")
                    }
                    .accessibilityIdentifier("ShowInformationToobarButton")
                }
            }
            .popover(isPresented: $showInfomrationView) {
                InformationView()
            }
            .background(
                Image("basketball_court")
                    .resizable()
                    .onTapGesture {
                        self.isRunning.toggle()
                        if self.shotClockValue == 0 {
                            self.shotClockValue = 24
                        }
                    }
                    .accessibilityIdentifier("BackgroundImage")
                    .gesture( DragGesture(minimumDistance: 0, coordinateSpace: .local)
                        .onEnded({ value in
                            if value.translation.width < 0 {
                                // left
                                self.shotClockValue = 14
                            }
                            if value.translation.width > 0 {
                                // right
                                self.shotClockValue = 24
                            }
                        }))
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
