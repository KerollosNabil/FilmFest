//
//  LibraryVCTests.swift
//  FilmFastTests
//
//  Created by MAC on 15/12/2020.
//

import XCTest
@testable import FilmFast

class LibraryVCTests: XCTestCase {
    
    var sut: LibraryVC!
    
    override func setUpWithError() throws {
        sut = LibraryVC()
        _ = sut.view
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    // MARK: nil checks
    func testLibraryVC_tableViewShouldNotEqualNil() {
        XCTAssertNotNil(sut.libraryTableView)
    }
    // MARK: data source checks
    
    func testDataSource_setTableViewDataSource() {
        XCTAssertNotNil(sut.libraryTableView.dataSource!)
        XCTAssertTrue(sut.libraryTableView.dataSource is LibraryVC)
    }
    
    // MARK: delegate checks
    func testDelegate_setTableViewDelegate() {
        XCTAssertNotNil(sut.libraryTableView.delegate)
        XCTAssertTrue(sut.libraryTableView.delegate is LibraryVC)
    }

}
