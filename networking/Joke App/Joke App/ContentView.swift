//
//  ContentView.swift
//  Joke App
//
//  Created by Graceson Thompson on 7/23/24.
//

import SwiftUI

struct ContentView: View {
    @State var  joke: String = "Click the Button"
    var body: some View {
        VStack {
            Spacer()
            Text(joke)
            Spacer()
            Button(action: {
                Task{
                    await apicall()
                }
            }, label: {
                Text("Get a Random Joke")
            })
        }
        .padding()
    }
    
    func apicall () async {
        //1.URL
        if let url = URL(string: "https://v2.jokeapi.dev/joke/Any?type=single"){
            //2.URLRequest
            let request = URLRequest(url: url)
            
            
            //3.URLSession
            do {
                let (data,_) = try await URLSession.shared.data(for: request)
                
                let decoder = JSONDecoder()
                do {
                    let searchResponse = try decoder.decode(SearchResponse.self, from: data)
                    
                    if let joke = searchResponse.joke {
                        self.joke = joke
                        
                    }
                    print("Should Never get here")
                }
                catch{
                    print(error)
                }
            }
            catch{
                print(error)
            }
            
        }
    }
}


#Preview {
    ContentView()
}
