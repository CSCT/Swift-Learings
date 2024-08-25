//
//  BusinessSearch.swift
//  CitySights App
//
//  Created by Graceson Thompson on 8/22/24.
//

import Foundation

struct BusinessSearch: Decodable{
    var businesses = [Business]()
    var region = Region()
    var total = 0
}

struct Region:Decodable {
    var center: Coordinate?
}

struct Coordinate : Decodable{
    var latitude : Double?
    var longitude : Double?
}
