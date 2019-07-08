//
//  LocalsDelegate.swift
//  FalabellaProject
//
//  Created by Nelson Ramirez on 7/7/19.
//  Copyright © 2019 Nelson. All rights reserved.
//

import UIKit

class LocalsDelegate: NSObject {
    var viewController: LocalsViewController?
}


extension LocalsDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let local = viewController?.locals?[indexPath.row] else {
            return
        }
        viewController?.showDetailLocal(local: local)
    }
}
