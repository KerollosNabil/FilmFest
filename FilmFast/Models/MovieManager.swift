//
//  MovieManager.swift
//  FilmFast
//
//  Created by MAC on 15/12/2020.
//

import Foundation

class MovieManager {
    var moviesToSee:Int {return moviesToSeeArray.count}
    var moviesSeen:Int {return moviesSeenArray.count}
    
    private var moviesToSeeArray = [Movie]()
    private var moviesSeenArray = [Movie]()
    
    func addMovie(movie:Movie) {
        moviesToSeeArray.append(movie)
    }
    func movieAtIndex(index: Int) -> Movie? {
        guard index < moviesToSee else {
            return nil
        }
        return moviesToSeeArray[index]
    }
    func checkOffMovieAt(index: Int){
        guard index < moviesToSee , let currentMovie = movieAtIndex(index: index) else {
            return
        }
        
        moviesSeenArray.append(currentMovie)
        moviesToSeeArray.remove(at: index)
    }
    func checkedOffMovieAt(index: Int) -> Movie?{
        guard index < moviesSeen else {
            return nil
        }
        return moviesSeenArray[index]
    }
    func clearArrays(){
        moviesToSeeArray.removeAll()
        moviesSeenArray.removeAll()
    }
}
