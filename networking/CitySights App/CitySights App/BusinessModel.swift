//
//  BusinessModel.swift
//  CitySights App
//
//  Created by Graceson Thompson on 10/19/24.
//

import Foundation
import SwiftUI

@Observable
class BusinessModel {
    var businesses = [Business]()
    var query: String = ""
    var selectedBusiness: Business?
    
    var service = DataService()
    
    func getBusinesses() {
        Task {
            businesses = await service.businessSearch()
        }
    }
}
