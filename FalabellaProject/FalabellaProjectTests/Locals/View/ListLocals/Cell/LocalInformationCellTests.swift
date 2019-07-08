//
//  LocalInformationCellTests.swift
//  FalabellaProjectTests
//
//  Created by Nelson Ramirez on 7/8/19.
//  Copyright © 2019 Nelson. All rights reserved.
//

import XCTest
@testable import FalabellaProject

class LocalInformationCellTests: XCTestCase {
    var sut: LocalInformationCell!

    override func setUp() {
        super.setUp()
        sut = LocalInformationCell()
        sut.setup(local: LocalModel(date: "", localId: "", localName: "LocalName", commune: "", locationName: "LocationName", direction: "Direction", startTime: "", endTime: "", phone: ""))
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testCell() {
        let localName = sut.subviews[0].subviews[0] as! UILabel
        let direction = sut.subviews[0].subviews[1] as! UILabel
        let localidad = sut.subviews[0].subviews[2] as! UILabel
        
        XCTAssertEqual(localName.text, "Nombre del local: LocalName")
        XCTAssertEqual(direction.text, "Direccion: Direction")
        XCTAssertEqual(localidad.text, "Localidad: LocationName")
    }
}
