//
//  City.swift
//  Guidebook
//
//  Created by Graceson Thompson on 6/3/24.
//

import Foundation

struct City : Identifiable,Decodable {
    
    //Let makes JSON ignore this key when trying to parse
    let id = UUID ()
    
    var name : String
    var summary : String
    //Name of Image Asset
    var imageName : String
    
    var attractions : [Attraction]
}
