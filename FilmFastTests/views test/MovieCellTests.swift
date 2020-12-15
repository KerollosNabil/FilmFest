//
//  MovieCellTests.swift
//  FilmFastTests
//
//  Created by MAC on 15/12/2020.
//

import XCTest
@testable import FilmFast

class MovieCellTests: XCTestCase {
    
    var libraryControler: LibraryVC!
    let scifiMovie = Movie(title: "Sci-Fi")
    let arthouseMovie = Movie(title: "Arthouse Drama")
    let actionMovie = Movie(title: "Action/Adventure")

    override func setUpWithError() throws {
        libraryControler = LibraryVC()
        libraryControler.movieManager = MovieManager()
        _ = libraryControler.view
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        libraryControler = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCell_config_shouldSetThelabelsToMovieData(){
        let cell = MovieCell(style: .subtitle, reuseIdentifier: "MovieCell") 
        
        cell.setupMovieData(movie: Movie(title: "Indie comedy", releaseDate: "2018"))
        XCTAssertEqual(cell.textLabel?.text, "Indie comedy")
        XCTAssertEqual(cell.detailTextLabel?.text, "2018")
    }

    func testCell_section_SouldCheckOffCelectedMovie(){
        libraryControler.movieManager?.addMovie(movie: scifiMovie)
        libraryControler.movieManager?.addMovie(movie: actionMovie)
        libraryControler.libraryTableView.reloadData()
        
        libraryControler.libraryTableView.delegate?.tableView?(libraryControler.libraryTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(libraryControler.movieManager?.moviesToSee, 1)
        XCTAssertEqual(libraryControler.movieManager?.moviesSeen, 1)
        
        XCTAssertEqual(libraryControler.libraryTableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(libraryControler.libraryTableView.numberOfRows(inSection: 1), 1)

    }

}
