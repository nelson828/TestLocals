//
//  LocalsDataSourceTests.swift
//  FalabellaProjectTests
//
//  Created by Nelson Ramirez on 7/7/19.
//  Copyright © 2019 Nelson. All rights reserved.
//

import XCTest
@testable import FalabellaProject

class LocalsDataSourceTests: XCTestCase {
    var sut: LocalsDataSource!
    var viewController: LocalsViewController!

    override func setUp() {
        super.setUp()
        sut = LocalsDataSource()
        
        let localServiceLocator = LocalServiceLocator()
        viewController = LocalsViewController(presenter: LocalsPresenter(listLocalUseCase: localServiceLocator.listLocalsUseCase, filterLocalUseCase: localServiceLocator.filterLocalsUseCase), dataSource: sut, delegate: LocalsDelegate())
        
        let localOne = LocalModel(date: "", localId: "", localName: "", commune: "", locationName: "", direction: "", startTime: "", endTime: "", phone: "")
        let localTwo = LocalModel(date: "", localId: "", localName: "", commune: "", locationName: "", direction: "", startTime: "", endTime: "", phone: "")
        let localMock = [localOne, localTwo]
        
        viewController.locals = localMock
        viewController.viewDidLoad()
    }

    override func tearDown() {
        sut = nil
        viewController = nil
        super.tearDown()
    }
    
    func testCellForRow() {
        let localCell: UITableViewCell? = cell(at: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(localCell)
        
        let localTwoCell: UITableViewCell? = cell(at: IndexPath(row: 1, section: 0))
        XCTAssertNotNil(localTwoCell)
    }
    
    private func cell<T>(at indexPath: IndexPath) -> T? {
        guard let cell = sut.tableView(
            viewController.tableView,
            cellForRowAt: indexPath
            ) as? T else {
                XCTFail("Could not load cell of class \(T.self)")
                return nil
        }
        return cell
    }
}
