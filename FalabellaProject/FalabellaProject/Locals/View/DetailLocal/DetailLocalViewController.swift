//
//  DetailLocalViewController.swift
//  FalabellaProject
//
//  Created by Nelson Ramirez on 7/7/19.
//  Copyright © 2019 Nelson. All rights reserved.
//

import UIKit

class DetailLocalViewController: UIViewController {
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var localName: UILabel!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var endTime: UILabel!
    @IBOutlet weak var direction: UILabel!
    
    var localModel: LocalModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detalle Local"
        prepareLabels()
    }
    
    private func prepareLabels() {
        guard let localModel = localModel else {
            return
        }
        locationName.text = localModel.locationName
        phone.text = localModel.phone
        localName.text = localModel.localName
        startTime.text = localModel.startTime
        endTime.text = localModel.endTime
        direction.text = localModel.direction
    }
}
