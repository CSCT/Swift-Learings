//
//  User.swift
//  Pick-A-Fit
//
//  Created by Graceson Thompson on 2/5/24.
//

import Foundation

struct User: Identifiable, Codable{
    let id: String
    let fullname: String
    let email: String
    
    var initials: String{
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname){
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return("Error in Initials")
    }
    ///This is where we would store field such as phone number, username, etc.
}

extension User {
    static var MOCK_USER = User(id: UUID().uuidString, fullname: "Colby Thompson", email: "test@email.com")
}
