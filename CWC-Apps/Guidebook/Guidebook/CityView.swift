//
//  ContentView.swift
//  Guidebook
//
//  Created by Graceson Thompson on 6/3/24.
//

import SwiftUI

struct CityView: View {
    @State  var cities = [City]()
    var dataService = DataService()
    
    var body: some View {
        NavigationStack {
            
            ScrollView (showsIndicators: false){
                VStack {
                    ForEach(cities) {city in
                        NavigationLink {
                            AttractionView(city: city)
                        } label: {
                            CityCard(city: city)
                                .padding(.bottom, 20)
                        }
                    }
                }
                .padding()
                
            }
            
            .onAppear{
                cities = dataService.getFileData()
            }
            
        } 
    }
}

#Preview {
    CityView()
}
