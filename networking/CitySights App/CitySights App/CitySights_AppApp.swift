//
//  CitySights_AppApp.swift
//  CitySights App
//
//  Created by Graceson Thompson on 7/27/24.
//

import SwiftUI

@main
struct CitySights_AppApp: App {
    @State var businessModel = BusinessModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(businessModel)
        }
    }
}
