//
//  FilterLocalsUseCase.swift
//  FalabellaProject
//
//  Created by Nelson Ramirez on 7/7/19.
//  Copyright © 2019 Nelson. All rights reserved.
//

import Foundation

struct FilterLocalsUseCase {
    private var localRestApi: LocalRestApi
    
    init(localRestApi: LocalRestApi) {
        self.localRestApi = localRestApi
    }

    func filterLocals(with text: String, completionHandler: @escaping ([LocalModel]?, ErrorModel?) -> Void) {
        localRestApi.filterLocals(with: text) { (localModel, errorModel) in
            completionHandler(localModel, errorModel)
        }
    }
}
