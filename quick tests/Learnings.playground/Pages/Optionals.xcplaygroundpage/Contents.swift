//: [Previous](@previous)

import Foundation

//MARK: Creating Optionals just add the "?"
var greeting : String? = "Hello"

//MARK: Using Optionals

// NEVER do this as it can lead to problems and should never force urwrap
if greeting != nil {
    print(greeting!)
}

//MARK: If Let
//Will unWrap the value inside the optional and assign it to "greetingValue"
if let greetingValue = greeting {
 print(greetingValue)
}

//MARK: Guard Let
/*
 Guard lets can be thought of as the opposite of an if let.
One key difference is that the unwrapped value (in the examples, the variable unwrappedString) can be used outside the {...} following the guard let
 */

func unwrap(optionalString: String?) {
    guard let unwrappedString = optionalString else {
        print("guard let returns out of the function")
        return
    }
    print("Now I can use the unwrapped int which has a value of \(unwrappedString)")
}

struct Person {
    var name: String?
    
    func walk(){
        
    }
}

var me: Person? = nil

//MARK: Optional Chaining
//Will only run if there is a person within me
me?.walk()

//MARK: Nil Coalescing Operatior
// Will give Default Name if the left ahdn side is nil
me?.name ?? "Default Name"
