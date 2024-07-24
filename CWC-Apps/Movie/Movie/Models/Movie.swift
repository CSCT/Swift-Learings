//
//  Movie.swift
//  Movie
//
//  Created by Graceson Thompson on 1/16/24.
//

import Foundation

struct Movie : Identifiable{
    
    var id: UUID = UUID()
    var title : String
    var director : String
    var description : String
    var releaseYear : String
    var rating : Int
    var watched : Bool
}
