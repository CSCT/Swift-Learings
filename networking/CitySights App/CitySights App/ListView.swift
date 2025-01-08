//
//  ListView.swift
//  CitySights App
//
//  Created by Graceson Thompson on 1/7/25.
//

import SwiftUI

struct ListView: View {
    @Environment(BusinessModel.self) var model
    
    var body: some View {
        List{
            ForEach(model.businesses){ business in
                VStack (spacing: 20){
                    HStack (spacing:0){
                        Image("list-placeholder-image")
                            .padding(.trailing, 16)
                        VStack(alignment:.leading){
                            Text(business.name ?? "Resturant")
                                .font(Font.system(size: 15))
                                .bold()
                            Text(TextHelper.distanceAwayText(meters: business.distance ?? 0))
                                .font(Font.system(size: 16))
                                .foregroundStyle(Color(red: 67/255, green: 71/255, blue: 76/255))
                        }
                        Spacer()
                        Image("regular_\(business.rating ?? 0)")
                    }
                    Divider()
                    
                }
                .onTapGesture {
                    model.selectedBusiness = business
                }
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

#Preview {
    ListView()
        .environment(BusinessModel())
}
