//
//  DataService.swift
//  Movie
//
//  Created by Graceson Thompson on 1/16/24.
//

import Foundation

struct DataService{
    
    func getWatchedMovies() -> [Movie]{
        return [Movie(title: "Gone with the Wind", director: "Victor Fleming", description: "A timeless epic set during the American Civil War, known for its memorable characters and sweeping romance", releaseYear: "1939", rating: 4, watched: true),
                Movie(title: "The Godfather", director: "Francis Ford Coppola", description: "A crime drama that explores the Italian-American Mafia, featuring Marlon Brando and Al Pacino.", releaseYear: "1972", rating: 3, watched: true)]
    }    
    func getUnwatchedMovies() -> [Movie]{
        return [  Movie(title: "Casablanca", director: "Michael Curtiz", description: "A romantic drama set in World War II, starring Humphrey Bogart and Ingrid Bergman.", releaseYear: "1942",rating: 2,watched: false),
                  Movie(title: "Citizen Kane", director: "Orson Welles", description: "Often cited as one of the greatest films ever made, it tells the story of a newspaper magnate's rise and fall.", releaseYear: "1941", rating: 0,watched: false)]
    }
}
