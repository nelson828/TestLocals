//
//  LocalUseCase.swift
//  FalabellaProject
//
//  Created by Nelson Ramirez on 7/7/19.
//  Copyright © 2019 Nelson. All rights reserved.
//

import Foundation

struct ListLocalsUseCase {
    private var localRestApi: LocalRestApi
    
    init(localRestApi: LocalRestApi) {
        self.localRestApi = localRestApi
    }
    
    func listLocals(completionHandler: @escaping ([LocalModel]?, ErrorModel?) -> Void) {
        localRestApi.fetchLocals { (localModel, errorModel) in
            completionHandler(localModel, errorModel)
        }
    }
}
