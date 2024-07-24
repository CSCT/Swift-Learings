//
//  JournalView.swift
//  Journal-App
//
//  Created by Graceson Thompson on 1/26/24.
//

import SwiftUI

struct JournalView: View {
    var body: some View {
        GeometryReader{ proxy in
            
            ScrollView{
                LazyVGrid(columns: [GridItem(spacing: 10),
                                    GridItem(spacing: 10)],spacing: 10){
                    Text("Box 1")
                    Text("Box 2")
                    Text("Box 3")
                }
            }
        }
    }
}

#Preview {
    JournalView()
}
