//
//  LocalsDataSource.swift
//  FalabellaProject
//
//  Created by Nelson Ramirez on 7/7/19.
//  Copyright © 2019 Nelson. All rights reserved.
//

import UIKit

class LocalsDataSource: NSObject {
    var viewController: LocalsViewController?
}

extension LocalsDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let locals = viewController?.locals else {
            return 0
        }
        return locals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let locals = viewController?.locals else {
            return UITableViewCell()
        }
        return prepareLocalInformationCell(locals[indexPath.row], tableView)
    }
    
    private func prepareLocalInformationCell(_ local: LocalModel, _ tableView: UITableView) -> LocalInformationCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocalInformationCellIdentifier") as! LocalInformationCell
        cell.setup(local: local)
        return cell
    }
}
