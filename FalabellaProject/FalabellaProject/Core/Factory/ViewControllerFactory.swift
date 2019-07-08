//
//  ViewControllerFactory.swift
//  FalabellaProject
//
//  Created by Nelson Ramirez on 7/7/19.
//  Copyright © 2019 Nelson. All rights reserved.
//

import UIKit

class ViewControllerFactory {
    private static var localServiceLocator = LocalServiceLocator()

    class func viewController(type: ViewFactoryType) -> UIViewController {
        switch type {
        case .login:
            return LoginViewController()
        case .locals:
            let presenter = LocalsPresenter(
                listLocalUseCase: localServiceLocator.listLocalsUseCase,
                filterLocalUseCase: localServiceLocator.filterLocalsUseCase
            )
            let viewController = LocalsViewController(presenter: presenter, dataSource: LocalsDataSource(), delegate: LocalsDelegate())
            return viewController
        case .detailLocal:
            let viewController = DetailLocalViewController()
            return viewController
        }
    }
}
