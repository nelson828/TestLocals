//
//  FilterLocalsUseCaseTests.swift
//  FalabellaProjectTests
//
//  Created by Nelson Ramirez on 7/8/19.
//  Copyright © 2019 Nelson. All rights reserved.
//

@testable import FalabellaProject
import XCTest

class FilterLocalsUseCaseTests: XCTestCase {
    var sut: FilterLocalsUseCase!
    var restApiMock: LocalRestApiMock!
    
    override func setUp() {
        super.setUp()
        
        restApiMock = LocalRestApiMock()
        sut = FilterLocalsUseCase(localRestApi: restApiMock)
    }
    
    override func tearDown() {
        sut = nil
        restApiMock = nil
        super.tearDown()
    }
    
    func testSuccessResponse() {
        restApiMock.filterLocalsIsSuccess = true
        let exp = expectation(description: "testSuccessResponse")
        
        sut.filterLocals(with: "text") { (localModel, errorModel) in
            exp.fulfill()
            XCTAssertNotNil(localModel)
            XCTAssertNil(errorModel)
        }
        
        wait(for: [exp], timeout: 5)
    }
    
    func testFailureResponse() {
        restApiMock.filterLocalsIsSuccess = false
        let exp = expectation(description: "testFailureResponse")
        
        sut.filterLocals(with: "text") { (localModel, errorModel) in
            exp.fulfill()
            XCTAssertNil(localModel)
            XCTAssertNotNil(errorModel)
        }
        
        wait(for: [exp], timeout: 5)
    }
}
