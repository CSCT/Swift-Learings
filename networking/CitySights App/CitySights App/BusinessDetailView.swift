//
//  BusinessDetailView.swift
//  CitySights App
//
//  Created by Graceson Thompson on 9/8/24.
//

import SwiftUI

struct BusinessDetailView: View {
    var business: Business?
    
    var body: some View {
        Text(business?.name ?? "0")
    }
}

#Preview {
    BusinessDetailView()
}
