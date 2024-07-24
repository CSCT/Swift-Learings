//
//  PhotoView.swift
//  Restaurant
//
//  Created by Graceson Thompson on 1/23/24.
//

import SwiftUI

struct PhotoView: View {
    @Binding var selectedPhoto : String
    @Binding var sheetVisible : Bool
    var body: some View {
        ZStack{
            Image(selectedPhoto)
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack{
                HStack{
                    Spacer()
                    
                    Button(action: {
                        sheetVisible = false
                    }, label: {
                        Image(systemName: "x.circle")
                            .foregroundColor(.black)
                            .scaleEffect(2)
                    })
                    .padding()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    PhotoView(selectedPhoto: Binding.constant("gallery1"), 
              sheetVisible: Binding.constant(true))
}
