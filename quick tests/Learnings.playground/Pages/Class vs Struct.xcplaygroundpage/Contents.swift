
import Foundation
import SwiftUI

// 1. ASsignment of value types
var number = 1
var number2 = number
number = 2
number2

//2. Default Initalizers
struct StructPerson{
    var name: String
}

var struct1 = StructPerson(name: "John")

class ClassPerson{
    var name: String
    
    init(name: String){
        self.name = name
    }
}

var class1 = ClassPerson(name: "Class Tom")

//2. Assignment of Structs vs Classes
var struct2 = struct1
struct1.name = "Struct Tom"
//struct2 name remains unchanged because assignement for structs creates copies
struct2.name //John

var class2 = class1
class1.name = "Changed Name Tom"
//Classes points to same memory so do not copy the data
class2.name //Changed Name Tom

//4. Mutabilty
let struct3 = StructPerson(name: "Struct Sara")
let class3 = ClassPerson(name: "Class Sara")

//struct3 = StructPerson(name: "Jen") Both dont work
//class3 = ClassPerson(name: "Jen")

//struct3.name = "Jen" Does not work ... Can not change values of Structs
class3.name = "Jen" //Does work because you are not changeing the pointer but only changing the value the pointer is pointing to


//5. Passsing Structs and Classes into function

func passInto(thing: StructPerson){
//    thing.name = "Test"
}

// A copy is created and then passed into
passInto(thing: struct2)

func passClassInto(classthing: ClassPerson){
    classthing.name = "Test"
}

class2.name
passClassInto(classthing: class2)
class2.name
