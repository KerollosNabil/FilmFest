//
//  DataServicesTests.swift
//  FilmFastTests
//
//  Created by MAC on 15/12/2020.
//

import XCTest
@testable import FilmFast

class DataServicesTests: XCTestCase {

    var sut:LibraryVC!
    var mock:TableViewMock!
    let scifiMovie = Movie(title: "Sci-Fi")
    let arthouseMovie = Movie(title: "Arthouse Drama")
    let actionMovie = Movie(title: "Action/Adventure")
    override func setUpWithError() throws {
        sut = LibraryVC()
        _ = sut.view
        sut.movieManager = MovieManager()
        mock = TableViewMock.initMockTableView(libraray: sut)
    }

    override func tearDownWithError() throws {
        sut = nil
        mock = nil
    }

    func testTableViewSection_count_returnTwo(){
        XCTAssertEqual(sut.libraryTableView.numberOfSections, 2)
    }
    
    func testTableViewSection_count_sectionOne_returnMoviesToSeeCount(){
        sut.movieManager?.addMovie(movie: scifiMovie)
        sut.movieManager?.addMovie(movie: actionMovie)
        
        XCTAssertEqual(sut.libraryTableView.numberOfRows(inSection: 0), 2)
        
        sut.movieManager?.addMovie(movie: arthouseMovie)
        sut.libraryTableView.reloadData()
        
        XCTAssertEqual(sut.libraryTableView.numberOfRows(inSection: 0), 3)

    }
    
    func testTableViewSection_count_sectionTwo_returnMoviesSeenCount(){
        sut.movieManager?.addMovie(movie: scifiMovie)
        sut.movieManager?.addMovie(movie: actionMovie)
        
        XCTAssertEqual(sut.libraryTableView.numberOfRows(inSection: 0), 2)
        XCTAssertEqual(sut.libraryTableView.numberOfRows(inSection: 1), 0)
        
        
        sut.movieManager?.addMovie(movie: arthouseMovie)
        sut.libraryTableView.reloadData()
        
        XCTAssertEqual(sut.libraryTableView.numberOfRows(inSection: 0), 3)
        XCTAssertEqual(sut.libraryTableView.numberOfRows(inSection: 1), 0)
        
        
        sut.movieManager?.checkOffMovieAt(index: 0)
        sut.libraryTableView.reloadData()
        
        XCTAssertEqual(sut.libraryTableView.numberOfRows(inSection: 0), 2)
        XCTAssertEqual(sut.libraryTableView.numberOfRows(inSection: 1), 1)
        
        
        sut.movieManager?.checkOffMovieAt(index: 0)
        sut.libraryTableView.reloadData()
        
        XCTAssertEqual(sut.libraryTableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(sut.libraryTableView.numberOfRows(inSection: 1), 2)

    }
    
    func testCell_rowAtIndex_returnsMovieCell(){
        sut.movieManager?.addMovie(movie: scifiMovie)
        sut.libraryTableView.reloadData()
        
        let cellQueried = sut.libraryTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cellQueried is MovieCell)
    }
    
    func testCell_shouldDequeueCell(){
        
        sut.movieManager?.addMovie(movie: scifiMovie)
        mock.reloadData()
        
        _ = mock.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(mock.dequeueCellsProberly)
    }
    
    func testCell_sectionOneConfig_shouldSetCellData(){
       
        sut.movieManager?.addMovie(movie: scifiMovie)
        mock.reloadData()
        
        let cell = mock.cellForRow(at: IndexPath(row: 0, section: 0)) as! MovieCell
        
        XCTAssertEqual(cell.movieData, scifiMovie)
    }
    func testCell_sectionTowConfig_shouldSetCellData(){
       
        sut.movieManager?.addMovie(movie: scifiMovie)
        sut.movieManager?.addMovie(movie: actionMovie)
        sut.movieManager?.checkOffMovieAt(index: 1)
        mock.reloadData()
        
        let cell = mock.cellForRow(at: IndexPath(row: 0, section: 1)) as! MovieCell
        
        XCTAssertEqual(cell.movieData, actionMovie)
    }
    

}

class TableViewMock: UITableView {
    var dequeueCellsProberly = false
    
    class func initMockTableView(libraray: LibraryVC) -> TableViewMock{
        let mock = TableViewMock(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        mock.dataSource = libraray
        mock.delegate = libraray
        mock.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
        return mock
    }
    
    override func dequeueReusableCell(withIdentifier identifier: String) -> UITableViewCell? {
        dequeueCellsProberly = true
        return super.dequeueReusableCell(withIdentifier: identifier)
    }
    
}
