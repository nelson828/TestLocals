//
//  LoginViewController.swift
//  FalabellaProject
//
//  Created by Nelson Ramirez on 7/7/19.
//  Copyright © 2019 Nelson. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var userLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }

    @IBAction func LoginButton(_ sender: Any) {        
        //TODO: Add AES256
        let defaults = UserDefaults.standard
        let user = defaults.string(forKey: "User")
        let password = defaults.string(forKey: "Password")
        
        if userLabel.text != user && passwordLabel.text != password {
            invalidUserAlert()
            return
        }
        
        guard let window = UIApplication.shared.keyWindow
            else { fatalError("Could not load get application window") }
        let viewController = ViewControllerFactory.viewController(type: .locals)
        window.rootViewController = UINavigationController(rootViewController: viewController)
    }
    
    private func invalidUserAlert() {
        let alert = UIAlertController(title: "El Usuario o la Password no coinciden", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}
