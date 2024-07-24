//
//  MenuListRow.swift
//  Menu
//
//  Created by Graceson Thompson on 1/15/24.
//

import SwiftUI

struct MenuListRow: View {
    var item : MenuItem
    
    var body: some View {
        HStack{
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 10,style: .circular ))
            
            Text(item.name)
                .bold()
            
            Spacer()
            
            Text("$\(item.price)")
        }
        .listRowSeparator(.hidden)
        .listRowBackground(
            Color(.brown)
                .opacity(0.1)
        )
        
    }
}

#Preview {
    MenuListRow(item: MenuItem(name: "Preview", price: "10.99", imageName: "tako-sushi"))
}
