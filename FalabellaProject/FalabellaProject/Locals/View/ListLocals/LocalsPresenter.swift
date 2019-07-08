//
//  LocalsPresenter.swift
//  FalabellaProject
//
//  Created by Nelson Ramirez on 7/7/19.
//  Copyright © 2019 Nelson. All rights reserved.
//

import Foundation

class LocalsPresenter: LocalsPresenterProtocol {
    var localView: LocalsView?
    
    private let listLocalUseCase: ListLocalsUseCase
    private let filterLocalUseCase: FilterLocalsUseCase
    
    init(
        listLocalUseCase: ListLocalsUseCase,
        filterLocalUseCase: FilterLocalsUseCase
    ) {
        self.listLocalUseCase = listLocalUseCase
        self.filterLocalUseCase = filterLocalUseCase
    }
    
    func fetchLocals() {
        listLocalUseCase.listLocals { (localModel, errorModel) in
            if let locals = localModel {
                self.localView?.show(locals)
            } else {
                self.localView?.showError()
            }
        }
    }
    
    func filterLocals(with text: String) {
        filterLocalUseCase.filterLocals(with: text) { (localModel, errorModel) in
            if let locals = localModel {
                self.localView?.show(locals)
            } else {
                self.localView?.showError()
            }
        }
    }
}
