//
//  DataService.swift
//  CitySights App
//
//  Created by Graceson Thompson on 8/20/24.
//

import Foundation

struct DataService {
    
    //Abstracts key and provides protection
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func businessSearch() async{
        
        // Check if key exists
        guard apiKey != nil else {
            return
        }
        
        // Create url
        if let url = URL(string: "https://api.yelp.com/v3/businesses/search?latitude=35.665517&longitude=139.770398&categories=restaurants&limit=5"){
            
            // Create Request
            var request = URLRequest(url: url)
            request.addValue("Bearer \(apiKey!)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "accept")
            
            // Send Request
            do{
                let (data,response) = try await URLSession.shared.data(for:request)
                
                print(data)
                print(response)
            }
            catch{
                print(error)
            }
        }
    }
    
}
