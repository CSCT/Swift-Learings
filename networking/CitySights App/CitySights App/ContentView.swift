//
//  ContentView.swift
//  CitySights App
//
//  Created by Graceson Thompson on 7/27/24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(BusinessModel.self) var model

    var body: some View {
        
        @Bindable var model = model
        VStack{
            HStack {
                
                TextField("What are you looking for?", text: $model.query)
                    .textFieldStyle(.roundedBorder)
                Button(action: {
                    //TODO: Implement Query
                }, label: {
                    Text("Go")
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })
            }
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
        .onAppear {
            model.getBusinesses()
        }
        .sheet(item: $model.selectedBusiness) { item in
            BusinessDetailView()
        }
    }
}

#Preview {
    ContentView()
}
