//
//  TeamsSearch.swift
//  football-data
//
//  Created by Graceson Thompson on 9/15/24.
//

import Foundation

struct TeamResponse: Decodable {
    
    var count: Int
    var teams: [Team]
}

struct Team: Decodable, Identifiable {
    
    var id: Int
    var name: String?
    var venue: String?
    
}
