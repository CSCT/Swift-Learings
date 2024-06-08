//: [Previous](@previous)

import Foundation

//Creation
var emptyDictionary = [String:String]()
var dictionary : [String:String] = ["Person1": "Colby","Person2": "Caitlin"]

//Replacement
dictionary["Person1"] = "Joey"

//Lookup returns an optional
print(dictionary["Person1"])

if let value = dictionary["Person1"] {
    print(value)
}

