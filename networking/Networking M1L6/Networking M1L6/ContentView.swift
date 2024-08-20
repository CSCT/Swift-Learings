//
//  ContentView.swift
//  Networking M1L6
//
//  Created by Graceson Thompson on 7/21/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            await apiCall()
        }
    }
    
    func apiCall() async{
        //1. URL -> returns optional
        if let url = URL(string:"https://api.pexels.com/v1/search?query=nature&per_page=1") {
            
            //2. URLRequest
            var request = URLRequest(url: url)
            //Adding header field
            request.addValue("PWUp6sAtMGRrY1HPn8r6nOw8qOCdsc136yAdSyL6Y5m1WEDSc2cCitjh", forHTTPHeaderField: "Authorization")
            
            //3. URLSession
            do {
                let (data,response) = try await URLSession.shared.data(for: request)
                
                let decoder = JSONDecoder()
                do {
                    let searchResponse = try decoder.decode(SearchResponse.self, from: data)
                    
                    for photo in searchResponse.photos {
                        print(photo)
                    }
                }
                catch{
                    print(error)
                }//Decoder
            }//URLSession
            catch{
                print(error)
            }
        }
    }
}

#Preview {
    ContentView()
}
