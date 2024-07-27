//
//  Post.swift
//  A3
//
//  Created by Graceson Thompson on 10/30/23.
//

import Foundation

struct Post : Codable {
    let time : Date
    let message : String
    let id : String
    var likes : [String]
}
