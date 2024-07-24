//
//  ContentView.swift
//  MenuL5Challenge
//
//  Created by Graceson Thompson on 1/14/24.
//

import SwiftUI

struct ContentView: View {
    
    let words : [String] = ["Caitlin","Colby","Joey","Hudson","Andreas"]
    
    @State var items = [String]()
    
    var body: some View {
        
        VStack{
            
            List(items, id: \.self){ item in
                Text(item)
            }
            Button("Add Word"){
                let randIndex = Int.random(in: 0...words.count - 1)
                items.append(words[randIndex])
            }
        }
    }
}
        
#Preview {
    ContentView()
}
