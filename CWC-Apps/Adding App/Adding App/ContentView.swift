//
//  ContentView.swift
//  Adding App
//
//  Created by Graceson Thompson on 1/11/24.
//

import SwiftUI


struct TapMeView: View {
    @State var count : Int = 0
    
    @State var add : Bool = true
    
    var body: some View {
        VStack {
            Text(String(count))
            Button("Tap Me!") {
                increase_or_decrease()
            }
        }
        .padding()
    }
    
    
    func increase_or_decrease(){
        
        addOrSubtract()
        
        if add {
            increase()
        }
        else{
            decrease()
        }

    }
    
    
    func addOrSubtract(){
        if count > 50{
            add = false
        }
        else if count < 0{
            add = true
        }
    }
    
    func increase(){
        count += Int.random(in: 2...10)
        
    }
    
    func decrease(){
        count -= Int.random(in: 2...10)

    }
}

#Preview {
    TapMeView()
}
