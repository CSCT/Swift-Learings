//
//  ContentView.swift
//  Journal-App
//
//  Created by Graceson Thompson on 1/26/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            JournalView()
                .tabItem {
                VStack{
                    Image(systemName: "gear")
                    Text("Settings")
                }
            }
            
            SettingsView()
                .tabItem {
                VStack{
                    Image(systemName: "book.fill")
                    Text("Journal")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
