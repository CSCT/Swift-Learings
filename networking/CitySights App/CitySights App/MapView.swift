//
//  MapView.swift
//  CitySights App
//
//  Created by Graceson Thompson on 1/7/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @Environment(BusinessModel.self) var model
    @State var selectedBusinessId: String?
        
    var body: some View {
        Map(selection: $selectedBusinessId) {
            ForEach(model.businesses, id: \.id) { business in
                Marker(business.name ?? "Restaurant", coordinate: CLLocationCoordinate2D(latitude: business.coordinates?.latitude ?? 0, longitude: business.coordinates?.longitude ?? 0))
                    .tag(business.id ?? "None")
            }
        }
        .onChange(of: selectedBusinessId) { oldValue, newValue in
            //Find the Businness which matches this id
            let business = model.businesses.first { business in
                business.id == selectedBusinessId
            }
            
            if let business = business {
                model.selectedBusiness = business
            }
        }
    }
}

#Preview {
    MapView()
}
