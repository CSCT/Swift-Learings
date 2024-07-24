//
//  ContentView.swift
//  War Card Game
//
//  Created by Graceson Thompson on 12/24/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard : String = "card7"
    @State var cpuCard : String = "card13"
    
    @State var playerScore : Int = 0
    @State var cpuScore : Int = 0
    
    var body: some View {
        
        ZStack{
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                Button(action: {
                    deal()
                }, label: {
                    Image("button")
                })
                
                Spacer()
                
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundColor(Color.white)
                .font(.title)
                
                Spacer()
        }
    }
}

    func deal(){
        //Randomize the players card
        var playerCardValue : Int = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardValue)
        
        //Randomize the cpus card
        var cpuCardValue : Int = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuCardValue)
        
        //Update score
        if playerCardValue > cpuCardValue{
            playerScore += 1
        }
        else if playerCardValue < cpuCardValue{
            cpuScore += 1
        }
        
        
    }
}


#Preview {
    ContentView()
}
