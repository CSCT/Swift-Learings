//
//  Business.swift
//  CitySights App
//
//  Created by Graceson Thompson on 8/22/24.
//

import Foundation

struct Business: Decodable{
    var id : String?
    var alias: String?
    var categories: [Category]
    var coordinates: Coordinate?
    var displayPhone: String?
    var distance: Double?
    var image_url: String?
    var is_closed: Bool?
    var location: Location?
    var name, phone, price: String?
    var rating : Double?
    var reviewCount: Int?
    var url: String?
    
}

struct Category : Decodable{
    var alias: String?
    var title: String?
}

struct Location : Decodable{
    var address1: String?
    var address2: String?
    var address3: String?
    var city: String?
    var country: String?
    var display_address: [String]?
    var state: String?
    var zip_code: String?
}
