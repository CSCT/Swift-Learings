//
//  ContentView.swift
//  Movie
//
//  Created by Graceson Thompson on 1/16/24.
//

import SwiftUI

struct MovieView: View {
    @State var watchedMovies : [Movie] = [Movie]()
    
    var dataService : DataService = DataService()
    
    var body: some View {
        List(watchedMovies){ movie in
            MovieListView(movie: movie)
        }
        .onAppear(perform: {
            watchedMovies = dataService.getWatchedMovies()
        })
        HStack{
            BorderedButton(action: {watchedMovies = dataService.getUnwatchedMovies()}, title: "List to Watch")
            BorderedButton(action: {watchedMovies = dataService.getWatchedMovies()}, title: "Watched")
        }
        
    }
    
}

#Preview {
    MovieView()
}
