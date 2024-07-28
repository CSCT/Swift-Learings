//
//  ContentView.swift
//  CitySights App
//
//  Created by Graceson Thompson on 7/27/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var query: String = ""
    
    var body: some View {
        HStack {
            
            TextField("What are you looking for?", text: $query)
                .textFieldStyle(.roundedBorder)
            Button(action: {
                //TODO: Implement Query
            }, label: {
                Text("Go")
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
