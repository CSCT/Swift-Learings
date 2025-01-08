//
//  ContentView.swift
//  CitySights App
//
//  Created by Graceson Thompson on 7/27/24.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(BusinessModel.self) var model
    @State var selectedtab: Int = 0

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
            //Show Picker
            Picker("", selection: $selectedtab) {
                Text("List")
                    .tag(0)
                Text("Map")
                    .tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            
            //Show map or list
            if selectedtab == 1 {
                MapView()
            }
            else{
                ListView()
            }
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
    HomeView()
        .environment(BusinessModel())
}
