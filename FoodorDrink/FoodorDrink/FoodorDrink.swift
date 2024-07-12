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
    
    
    var body: some View {
        NavigationStack{
            HStack {
                
                NavigationLink {
                    ScrollView{
                        LazyVGrid(columns: [GridItem(.fixed(300))], content: {
                            ForEach(items){item in
                                ItemView(item: Item(name: item.name, imageName: "burger", calories: item.calories))
                            }                        })
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
                    ItemView(item: Item(name: "Burger", imageName: "burger", calories: 500))
                } label: {
                    ZStack{
                        Color.blue
                            .frame(width: 150,height: 150)
                            .clipShape(.rect(cornerRadius: 15))
                        VStack{
                            Text("🧋")
                            Text("Food")
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
