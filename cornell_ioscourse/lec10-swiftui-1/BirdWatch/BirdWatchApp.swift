//
//  BirdWatchApp.swift
//  BirdWatch
//
//  Created by Vin Bui on 11/13/23.
//

import SwiftUI
//Order of modifiers MATTER A LOT, they create on top of previous modifier
//Stacks can only contain 10 views at a time

@main
struct BirdWatchApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
