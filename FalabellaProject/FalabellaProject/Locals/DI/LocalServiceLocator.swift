//
//  LocalsServiceLocator.swift
//  FalabellaProject
//
//  Created by Nelson Ramirez on 7/7/19.
//  Copyright © 2019 Nelson. All rights reserved.
//

import Foundation

class LocalServiceLocator {
    private var localRestApi: LocalRestApi {
        return LocalAlamofireRestApi()
    }
    
    var listLocalsUseCase: ListLocalsUseCase {
        return ListLocalsUseCase(localRestApi: localRestApi)
    }
    
    var filterLocalsUseCase: FilterLocalsUseCase {
        return FilterLocalsUseCase(localRestApi: localRestApi)
    }
}
