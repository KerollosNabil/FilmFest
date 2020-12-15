//
//  MovieManagerTests.swift
//  FilmFastTests
//
//  Created by MAC on 15/12/2020.
//

import XCTest
@testable import FilmFast

class MovieManagerTests: XCTestCase {
    
    var sut: MovieManager!
    
    let scifiMovie = Movie(title: "Sci-Fi")
    let arthouseMovie = Movie(title: "Arthouse Drama")
    let actionMovie = Movie(title: "Action/Adventure")

    override func setUpWithError() throws {
        sut = MovieManager()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    // MARK: Initial Values
    func testInit_moviesToSee_moviesSeen_returnsZero(){
        XCTAssertEqual(sut.moviesToSee, 0)
        XCTAssertEqual(sut.moviesSeen, 0)
    }

    // MARK: Add & Qury
    
    func testAdd_movieToSee_retuenOne(){
        sut.addMovie(movie: scifiMovie)
        
        XCTAssertEqual(sut.moviesToSee, 1)
    }
    
    func testQuery_returnMovieAtIndex() {
        sut.addMovie(movie: scifiMovie)
        
        var movieQueried = sut.movieAtIndex(index: 0)
        XCTAssertNotNil(movieQueried)
        XCTAssertEqual(movieQueried?.title, scifiMovie.title)
        
        movieQueried = sut.movieAtIndex(index: 1)
        XCTAssertNil(movieQueried)
    }
    
    // MARK: Check off Movie
    func testCheckOffMovie_UpdateMovieManagerCounts(){
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: actionMovie)
        sut.checkOffMovieAt(index: 0)
        
        XCTAssertEqual(sut.moviesToSee, 1)
        XCTAssertEqual(sut.moviesSeen, 1)
        
        sut.checkOffMovieAt(index: 0)
        
        XCTAssertEqual(sut.moviesToSee, 0)
        XCTAssertEqual(sut.moviesSeen, 2)
        
    }
    func testCheckOffMovie_removeMoviesFromMoviesToSeeArray(){
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: actionMovie)
        sut.checkOffMovieAt(index: 0)
        
        XCTAssertEqual(sut.movieAtIndex(index: 0)?.title, actionMovie.title)
    }
    func testCheckedOffMovieAtIndex_returnMovieAtIndex(){
        sut.addMovie(movie: scifiMovie)
        sut.checkOffMovieAt(index: 0)
        
        var movieQueried = sut.checkedOffMovieAt(index: 0)

        XCTAssertNotNil(movieQueried)
        XCTAssertEqual(movieQueried?.title, scifiMovie.title)
        
        movieQueried = sut.movieAtIndex(index: 1)
        XCTAssertNil(movieQueried)
    }
    
    // MARK: equatable movies
    func testEquatable_returnTrueWihtTheSameMovie(){
        let movie1 = Movie(title: "action", releaseDate: "1998")
        let movie12 = Movie(title: "action", releaseDate: "1998")
        XCTAssertEqual(movie1, movie12)
    }
    func testEquatable_returnFalseWothDefferentTitles(){
        let movie1 = Movie(title: "action", releaseDate: "1998")
        let movie12 = Movie(title: "adventure", releaseDate: "1998")
        XCTAssertNotEqual(movie1, movie12)
    }
    func testEquatable_returnFalseWithDefferentReleaseDates(){
        let movie1 = Movie(title: "action", releaseDate: "1998")
        let movie12 = Movie(title: "action", releaseDate: "1999")
        XCTAssertNotEqual(movie1, movie12)
    }
    
    // MARK: clear array
    func testClearArrays_returnArrayCountsOfZeros(){
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: actionMovie)
        
        sut.checkOffMovieAt(index: 0)
        
        XCTAssertEqual(sut.moviesToSee, 1)
        XCTAssertEqual(sut.moviesSeen, 1)
        
        sut.clearArrays()
        
        XCTAssertEqual(sut.moviesToSee, 0)
        XCTAssertEqual(sut.moviesSeen, 0)
    }
    // MARK: not allow duplicate array
    
    func testDuplicateMovies_souldNotBeAdded(){
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: scifiMovie)
        
        XCTAssertNotEqual(sut.moviesToSee, 1)
        
        
    }
}

