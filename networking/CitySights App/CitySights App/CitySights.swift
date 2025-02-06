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
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(businessModel)
                .fullScreenCover(isPresented: Binding.constant(true)) {
                    //TODO: on dismiss
                } content: {
                    OnboardingView()
                }

        }
    }
}
