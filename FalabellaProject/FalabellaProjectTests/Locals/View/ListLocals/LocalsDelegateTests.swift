//
//  LocalsDelegateTests.swift
//  FalabellaProjectTests
//
//  Created by Nelson Ramirez on 7/8/19.
//  Copyright © 2019 Nelson. All rights reserved.
//

import XCTest
@testable import FalabellaProject

class LocalsDelegateTests: XCTestCase {
    var sut: LocalsDelegate!
    var viewController: LocalsViewController!
    
    override func setUp() {
        super.setUp()
        sut = LocalsDelegate()
        
        let localServiceLocator = LocalServiceLocator()
        viewController = LocalsViewController(presenter: LocalsPresenter(listLocalUseCase: localServiceLocator.listLocalsUseCase, filterLocalUseCase: localServiceLocator.filterLocalsUseCase), dataSource: LocalsDataSource(), delegate: sut)
        
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
    
    func testHeight() {
        XCTAssertEqual(height(at: IndexPath(row: 0, section: 0)), 100)
        XCTAssertEqual(height(at: IndexPath(row: 1, section: 0)), 100)
    }

    private func height(at indexPath: IndexPath) -> CGFloat {
        return sut.tableView(viewController.tableView, heightForRowAt: indexPath)
    }
}
