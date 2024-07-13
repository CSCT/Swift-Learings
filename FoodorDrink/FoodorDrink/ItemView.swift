//
//  ItemView.swift
//  FoodorDrink
//
//  Created by Graceson Thompson on 7/6/24.
//

import SwiftUI


struct ItemView: View {
    
    var item : Item

    var body: some View {
        VStack{
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width:150,height: 150)
                .clipShape(.rect(cornerRadius: 15))
            
            Text("\(item.name): \(item.calories) Kcal")
            
        }
    }
}

#Preview {
    ItemView(item: Item(name: "Burger", imageName: "cheese", calories: 500, drink: false))
}
