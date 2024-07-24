//
//  GallaryView.swift
//  Restaurant
//
//  Created by Graceson Thompson on 1/17/24.
//

import SwiftUI

struct GallaryView: View {
    @State var photoData = [String]()
    @State var sheetVisible = false
    @State var selectedPhoto = ""
    var dataService = DataService()
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Gallery")
                .font(.largeTitle)
                .bold()
            
            GeometryReader{ proxy in
                
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: [GridItem(spacing: 10),
                                        GridItem(spacing: 10),
                                        GridItem(spacing: 10)],spacing: 10) {
                        ForEach(photoData,id: \.self){ photo in
                            Image(photo)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: (proxy.size.width - 20)/3)
                                .clipped()
                                .onTapGesture {
                                    selectedPhoto = photo
                                    sheetVisible = true
                                    
                                }
                        }
                    }
                }
            }
            
        }
        .padding(.horizontal)
        .onAppear(perform: {
            photoData = dataService.getPhotos()
        }).sheet(isPresented: $sheetVisible) {
            PhotoView(selectedPhoto: $selectedPhoto,
                      sheetVisible: $sheetVisible)
        }
    }
    
}

#Preview {
    GallaryView()
}
