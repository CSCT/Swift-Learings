//
//  DataService.swift
//  football-data
//
//  Created by Graceson Thompson on 9/15/24.
//
import Foundation

struct DataService {
    
    //Abstracts key and provides protection
    let apiKey = "609a9e3c5bf74d50a792d2d495b9e864"
    
    func teamsSearch() async -> [Team]{
        
        // Check if key exists
        guard apiKey != nil else {
            return [Team]()
        }
        
        // Create url
        if let url = URL(string: "https://api.football-data.org/v4/teams"){
            
            // Create Request
            var request = URLRequest(url: url)
            request.addValue(apiKey, forHTTPHeaderField: "X-Auth-Token")
            
            // Send Request
            do{
                let (data,_) = try await URLSession.shared.data(for:request)
                
                //Parse the JSON
                let decoder = JSONDecoder()
                let result = try decoder.decode(TeamResponse.self, from: data)
                return result.teams
            }
            catch{
                print(error)
            }
        }
        return [Team]()
    }
    
}
