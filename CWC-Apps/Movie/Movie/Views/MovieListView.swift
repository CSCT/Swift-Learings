//
//  MovieListView.swift
//  Movie
//
//  Created by Graceson Thompson on 1/16/24.
//

import SwiftUI

struct MovieListView: View {
    
    var movie : Movie

    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(movie.title)
                    .bold()
                Spacer()
                Text(movie.releaseYear)
            }
            Text("Directed by: \(movie.director)")
            Spacer()
            Text(movie.description)
            Spacer()
            HStack{
                Text("Personal Rating:")
                ForEach(0..<movie.rating,id: \.self){_ in 
                    Image("star.fill-yellow")
                }
            }
        }
        
    }
}
                
#Preview {
    MovieListView(movie: Movie(title: "Bob", director: "Colby", description: "About a love story where bob kills colby", releaseYear: "2024", rating: 5, watched: true))
}
