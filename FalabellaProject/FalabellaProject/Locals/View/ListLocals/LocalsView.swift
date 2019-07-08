//
//  LocalsView.swift
//  FalabellaProject
//
//  Created by Nelson Ramirez on 7/7/19.
//  Copyright © 2019 Nelson. All rights reserved.
//

import Foundation

protocol LocalsView {
    func show(_ locals: [LocalModel])
    func showError()
}
