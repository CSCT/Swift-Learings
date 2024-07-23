//: [Previous](@previous)

import Foundation

//MARK: Handle the error way 1: do-catch
do {
    try functionThatThrows()
}
catch {
    print("Error")
}

//MARK: Handle the error way 2: Ignore Error
try? functionThatThrows()


func functionThatThrows() throws {
    
}

