//
//  CitySights_AppApp.swift
//  CitySights App
//
//  Created by Graceson Thompson on 7/27/24.
//

import SwiftUI

@main
struct CitySights: App {
    @State var businessModel = BusinessModel()
    @AppStorage("onboardingCompleted") var needsOnboarding : Bool = true
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(businessModel)
                .fullScreenCover(isPresented: $needsOnboarding) {
                    //TODO: on dismiss
                    needsOnboarding = false
                } content: {
                    OnboardingView()
                }

        }
    }
}
