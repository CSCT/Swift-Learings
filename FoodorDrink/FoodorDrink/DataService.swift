//
//  DataService.swift
//  FoodorDrink
//
//  Created by Graceson Thompson on 7/11/24.
//

import Foundation

struct DataService{
    func getFileData() -> [Item]{
        
        //1. Get file path to Demodata.json
        if let url = Bundle.main.url(forResource: "DemoData", withExtension: "json"){
            do {
                //2. Read the file and turn it into Data
                let data = try Data(contentsOf: url)
                
                //3. Parse data into Swift instances
                let decoder = JSONDecoder()
                
                do {
                    let items = try decoder.decode([Item].self, from: data)
                    
                    return items
                }
                catch{
                    print("Could not parse the JSON. Failed with error: \(error)")
                }
                
            }
            catch{
                print("Could not read the file. Failed with error: \(error)")
            }
        }
        
        return [Item]()
    }
}
