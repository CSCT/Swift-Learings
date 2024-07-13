//
//  ContentView.swift
//  FoodorDrink
//
//  Created by Graceson Thompson on 6/23/24.
//

import SwiftUI

struct FoodorDrink: View {
    @State var items = [Item]()
    var dataService = DataService()
    let columnCount: Int = 2
    let gridSpacing: CGFloat = 16.0
    
    
    var body: some View {
        
        NavigationStack{
            HStack {
                
                NavigationLink {
                    ScrollView{
                        LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: gridSpacing), count: columnCount), spacing: gridSpacing) {
                            
                            ForEach(items){item in
                                if !item.drink {
                                    ItemView(item: Item(name: item.name, imageName: item.imageName, calories: item.calories, drink:item.drink))
                                }
                            }
                        }
                    }
                    .onAppear(perform: {
                        items = dataService.getFileData()

                    })
                    
                } label: {
                    ZStack{
                        Color.green
                            .frame(width: 150,height: 150)
                            .clipShape(.rect(cornerRadius: 15))

                        VStack{
                            Text("🍔")
                            Text("Food")
                            
                        }
                    }
                }
                .frame(width: 150,height: 150)
                .tint(.black)
                .font(.title)

                
                NavigationLink {
                    ScrollView {
                        LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: gridSpacing), count: columnCount), spacing: gridSpacing) {
                            
                            ForEach(items){item in
                                if item.drink {
                                    ItemView(item: Item(name: item.name, imageName: item.imageName, calories: item.calories, drink:item.drink))
                                }
                            }
                        }
                    }
                    .onAppear(perform: {
                        items = dataService.getFileData()

                    })
                } label: {
                    ZStack{
                        Color.blue
                            .frame(width: 150,height: 150)
                            .clipShape(.rect(cornerRadius: 15))
                        VStack{
                            Text("🧋")
                            Text("Drink")
                        }
                    }
                }
                .tint(.black)
                .font(.title)

            }
            
        }
    }
}

#Preview {
    FoodorDrink()
}
