//
//  LocalsPresenterTests.swift
//  FalabellaProjectTests
//
//  Created by Nelson Ramirez on 7/8/19.
//  Copyright © 2019 Nelson. All rights reserved.
//

@testable import FalabellaProject
import XCTest

class LocalsPresenterTests: XCTestCase {
    var sut: LocalsPresenter!
    var view: LocalsViewMock!
    var restApi: LocalRestApiMock!
    
    override func setUp() {
        super.setUp()
        
        view = LocalsViewMock()
        restApi = LocalRestApiMock()
        let listLocalUseCase = ListLocalsUseCase(localRestApi: restApi)
        let filterLocalUseCase = FilterLocalsUseCase(localRestApi: restApi)
        sut = LocalsPresenter(listLocalUseCase: listLocalUseCase, filterLocalUseCase: filterLocalUseCase)
        sut.localView = view
    }

    override func tearDown() {
        sut = nil
        view = nil
        restApi = nil
        super.tearDown()
    }
    
    func testFetchLocalsSuccess() {
        restApi.fetchLocalsIsSuccess = true
        sut.fetchLocals()
        XCTAssertTrue(view.didCallShowLocals)
        XCTAssertNotNil(view.locals)
        XCTAssertFalse(view.didCallShowError)
    }
    
    func testFetchLocalsError() {
        restApi.fetchLocalsIsSuccess = false
        sut.fetchLocals()
        XCTAssertFalse(view.didCallShowLocals)
        XCTAssertNil(view.locals)
        XCTAssertTrue(view.didCallShowError)
    }

    func testFilterLocalsSuccess() {
        restApi.filterLocalsIsSuccess = true
        sut.filterLocals(with: "test")
        XCTAssertTrue(view.didCallShowLocals)
        XCTAssertNotNil(view.locals)
        XCTAssertFalse(view.didCallShowError)
    }
    
    func testFilterLocalsError() {
        restApi.filterLocalsIsSuccess = false
        sut.filterLocals(with: "test")
        XCTAssertFalse(view.didCallShowLocals)
        XCTAssertNil(view.locals)
        XCTAssertTrue(view.didCallShowError)
    }
}
