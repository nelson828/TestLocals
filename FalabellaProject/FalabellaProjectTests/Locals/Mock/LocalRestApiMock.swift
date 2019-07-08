//
//  LocalRestApiMock.swift
//  FalabellaProjectTests
//
//  Created by Nelson Ramirez on 7/8/19.
//  Copyright © 2019 Nelson. All rights reserved.
//

@testable import FalabellaProject

class LocalRestApiMock: LocalRestApi {
    
    var fetchLocalsIsSuccess = false
    func fetchLocals(completionHandler: @escaping ([LocalModel]?, ErrorModel?) -> Void) {
        let localOne = LocalModel(date: "", localId: "", localName: "", commune: "", locationName: "", direction: "", startTime: "", endTime: "", phone: "")
        let localTwo = LocalModel(date: "", localId: "", localName: "", commune: "", locationName: "", direction: "", startTime: "", endTime: "", phone: "")
        let localMock = [localOne, localTwo]
        
        if fetchLocalsIsSuccess {
            completionHandler(localMock, nil)
        } else {
            completionHandler(nil, ErrorModel(error: "", exception: "", message: "", path: "", status: 500, timestamp: 100))
        }
    }
    
    var filterLocalsIsSuccess = false
    func filterLocals(with text: String, completionHandler: @escaping ([LocalModel]?, ErrorModel?) -> Void) {
        let localOne = LocalModel(date: "", localId: "", localName: "", commune: "", locationName: "", direction: "", startTime: "", endTime: "", phone: "")
        let localTwo = LocalModel(date: "", localId: "", localName: "", commune: "", locationName: "", direction: "", startTime: "", endTime: "", phone: "")
        let localMock = [localOne, localTwo]
        
        if filterLocalsIsSuccess {
            completionHandler(localMock, nil)
        } else {
            completionHandler(nil, ErrorModel(error: "", exception: "", message: "", path: "", status: 500, timestamp: 100))
        }
    }
}
