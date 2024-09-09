//
//  ContentView.swift
//  CitySights App
//
//  Created by Graceson Thompson on 7/27/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var businesses = [Business]()
    @State var query: String = ""
    @State var selectedBusiness: Business?
    var service = DataService()
    
    var body: some View {
        VStack{
            HStack {
                
                TextField("What are you looking for?", text: $query)
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
                ForEach(businesses){ business in
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
                        selectedBusiness = business
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            
            
        }
        .padding()
        .task {
            businesses = await service.businessSearch()
        }
        .sheet(item: $selectedBusiness) { item in
            BusinessDetailView(business: item)
        }
    }
}

#Preview {
    ContentView()
}
