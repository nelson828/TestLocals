//
//  LocalsViewMock.swift
//  FalabellaProjectTests
//
//  Created by Nelson Ramirez on 7/8/19.
//  Copyright © 2019 Nelson. All rights reserved.
//

@testable import FalabellaProject

class LocalsViewMock: LocalsView {    
    var didCallShowLocals = false
    var locals: [LocalModel]?
    func show(_ locals: [LocalModel]) {
        didCallShowLocals = true
        self.locals = locals
    }
    
    var didCallShowError = false
    func showError() {
        didCallShowError = true
    }
}
