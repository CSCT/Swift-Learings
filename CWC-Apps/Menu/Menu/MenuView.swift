//
//  ContentView.swift
//  Menu
//
//  Created by Graceson Thompson on 1/11/24.
//

import SwiftUI

struct MenuView: View {
    
    //[MenuItem]() -> creates empty array of menuitems
    @State var menuItems : [MenuItem] = [MenuItem]()
    
    var dataService :DataService = DataService()
    
    
    var body: some View {
        List(menuItems){ item in
            
            MenuListRow(item: item)
            
        }
        .listStyle(.plain)
        .onAppear(perform: {
            //Call for data
            menuItems = dataService.getData()
        })
    }
}

#Preview {
    MenuView()
}
