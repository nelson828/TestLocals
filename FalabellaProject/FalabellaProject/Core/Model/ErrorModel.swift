//
//  ErrorModel.swift
//  FalabellaProject
//
//  Created by Nelson Ramirez on 7/7/19.
//  Copyright © 2019 Nelson. All rights reserved.
//

struct ErrorModel: Codable {
    let error: String?
    let exception: String?
    let message: String
    let path: String?
    let status: Int?
    let timestamp: Float?
}
