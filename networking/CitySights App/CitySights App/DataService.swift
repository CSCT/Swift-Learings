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
    
    func businessSearch() async -> [Business]{
        
        // Check if key exists
        guard apiKey != nil else {
            return [Business]()
        }
        
        // Create url
        if let url = URL(string: "https://api.yelp.com/v3/businesses/search?latitude=35.665517&longitude=139.770398&categories=restaurants&limit=10"){
            
            // Create Request
            var request = URLRequest(url: url)
            request.addValue("Bearer \(apiKey!)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "accept")
            
            // Send Request
            do{
                let (data,_) = try await URLSession.shared.data(for:request)
                
                //Parse the JSON
                let decoder = JSONDecoder()
                let result = try decoder.decode(BusinessSearch.self, from: data)
                return result.businesses
            }
            catch{
                print(error)
            }
        }
        return [Business]()
    }
    
}
