//
//  Pick_A_FitApp.swift
//  Pick-A-Fit
//
//  Created by Graceson Thompson on 1/20/24.
//

import SwiftUI
import Firebase
import FirebaseCore

@main
struct Pick_A_FitApp: App {
    //Create Enviroment Object that can be used across the app
    @StateObject var viewModel = AuthViewModel()
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(viewModel)
        }
    }
}

