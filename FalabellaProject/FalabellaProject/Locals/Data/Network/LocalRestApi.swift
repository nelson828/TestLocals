//
//  LocalRestApi.swift
//  FalabellaProject
//
//  Created by Nelson Ramirez on 7/7/19.
//  Copyright © 2019 Nelson. All rights reserved.
//

import Foundation

protocol LocalRestApi {
    func fetchLocals(completionHandler: @escaping ([LocalModel]?, ErrorModel?) -> Void)
    func filterLocals(with text: String, completionHandler: @escaping ([LocalModel]?, ErrorModel?) -> Void)
}
