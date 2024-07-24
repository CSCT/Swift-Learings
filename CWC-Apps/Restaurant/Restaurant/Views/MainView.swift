//
//  ContentView.swift
//  Restaurant
//
//  Created by Graceson Thompson on 1/17/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            MenuView()
                .tabItem {
                    VStack{
                        Image(systemName: "menucard")
                        Text("Menu")
                    }
                }
            
            AboutView()
                .tabItem {
                    VStack{
                        Image(systemName: "info.circle")
                        Text("About")
                    }
                }
            
            GallaryView()
                .tabItem {
                    VStack{
                        Image(systemName: "photo")
                        Text("Gallary")
                    }
                }
        }
    }
}

#Preview {
    MainView()
}
