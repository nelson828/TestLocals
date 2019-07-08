//
//  LocalsViewController.swift
//  FalabellaProject
//
//  Created by Nelson Ramirez on 7/7/19.
//  Copyright © 2019 Nelson. All rights reserved.
//

import UIKit

class LocalsViewController: UIViewController {
    private var dataSource: LocalsDataSource?
    private var delegate: LocalsDelegate?
    private var presenter: LocalsPresenter?
    
    let tableView = UITableView()
    var locals: [LocalModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        let name = defaults.string(forKey: "Name")
        self.title = "Hola \(name ?? "")"
        
        self.view.backgroundColor = .white

        prepareTableView()
        registerCells()
        prepareNavigationItem()
        
        presenter?.fetchLocals()
    }
    
    convenience init(presenter: LocalsPresenter, dataSource: LocalsDataSource, delegate: LocalsDelegate) {
        self.init()
        self.presenter = presenter
        self.presenter?.localView = self
        self.dataSource = dataSource
        self.delegate = delegate
        self.dataSource?.viewController = self
        self.delegate?.viewController = self
    }
    
    private func prepareTableView() {
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    private func prepareNavigationItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(alertLogOut))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(alertFilter))
    }
    
    private func registerCells() {
        tableView.register(LocalInformationCell.self, forCellReuseIdentifier: "LocalInformationCellIdentifier")
    }
    
    @objc
    private func alertLogOut(){
        let alert = UIAlertController(title: "¿Estas seguro de cerrar la sesion?", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Si", style: .default, handler: { action in
            self.logOut()
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    private func logOut(){
        guard let window = UIApplication.shared.keyWindow
            else { fatalError("Could not load get application window") }
        let viewController = ViewControllerFactory.viewController(type: .login)
        window.rootViewController = UINavigationController(rootViewController: viewController)
    }
    
    @objc
    private func alertFilter(){
        let alert = UIAlertController(title: "Filtrar por palabra", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Ingresa la palabra"
        })
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            guard let text = alert.textFields?.first?.text else {
                return
            }
            self.filter(with: text)
        }))
        
        self.present(alert, animated: true)
    }
    
    private func filter(with text: String){
        if text.isEmpty {
            presenter?.fetchLocals()
        } else {
            presenter?.filterLocals(with: text)
        }
    }
    
    func showDetailLocal(local: LocalModel) {
        guard let viewController = ViewControllerFactory.viewController(type: .detailLocal) as? DetailLocalViewController else {
            return
        }
        viewController.localModel = local
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension LocalsViewController: LocalsView {
    func showError() {
        //TODO: Show Error
    }
    
    func show(_ locals: [LocalModel]) {
        self.locals = locals
        tableView.reloadData()
    }
}
