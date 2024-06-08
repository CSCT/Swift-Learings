import Foundation


var array = [Int]()
var dictionary : [String:String] = ["Person1": "Colby","Person2": "Caitlin","Person3": "Bob"]

// MARK: - For-Loop (... is inclusive. This is the range function like Python)
for index in 1...10 {
    array.append(index)
}

// MARK: - While Cards Version
for _ in 1...2 {
    print("Bob")
}

// MARK: - For-In
for index in 1..<array.count {
    print(array[index])
}

// MARK: - Looping through dictionaries
for (key,value) in dictionary {
    print(key,value)
}

var flag : Bool = false

while flag == false {
    print("While Loop")
    flag = true
}

// MARK: - Repeat-While Loop
repeat{
    print("Repeat Loop")
}while flag == false
