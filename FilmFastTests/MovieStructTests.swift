//
//  MovieStructTests.swift
//  FilmFastTests
//
//  Created by MAC on 13/12/2020.
//

import XCTest
@testable import FilmFast

class MovieStructTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit_movieWithTitle(){
        let testMovie = Movie(title:"koko")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, "koko")
    }
}
