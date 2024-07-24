//
//  MenuItem.swift
//  Menu
//
//  Created by Graceson Thompson on 1/14/24.
//

import Foundation

struct MenuItem : Identifiable {
    
    var id: UUID = UUID()
    var name : String
    ///String to include currency symbol
    var price : String
    var imageName : String
}
