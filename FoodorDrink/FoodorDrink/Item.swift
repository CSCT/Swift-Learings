//
//  Item.swift
//  FoodorDrink
//
//  Created by Graceson Thompson on 6/23/24.
//

import Foundation

struct Item : Decodable,Identifiable{
    
    let id = UUID()
    
    
    var name : String
    var imageName: String
    var calories: Int
    var drink : Bool
    
}
