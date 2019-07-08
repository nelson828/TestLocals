//
//  AppDelegate.swift
//  FalabellaProject
//
//  Created by Nelson Ramirez on 7/7/19.
//  Copyright © 2019 Nelson. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {

    var window: UIWindow?

    func prepareWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ViewControllerFactory.viewController(type: .login)
        window?.makeKeyAndVisible()
    }
}

extension AppDelegate: UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let defaults = UserDefaults.standard
        defaults.set("user", forKey: "User")
        defaults.set("password", forKey: "Password")
        defaults.set("Matias", forKey: "Name")
        prepareWindow()
        
        return true
    }
}
