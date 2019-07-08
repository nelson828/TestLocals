//
//  LocalInformationCell.swift
//  FalabellaProject
//
//  Created by Nelson Ramirez on 7/7/19.
//  Copyright © 2019 Nelson. All rights reserved.
//

import UIKit

class LocalInformationCell: UITableViewCell {
    let name = UILabel(frame: .zero)
    let direction = UILabel(frame: .zero)
    let location = UILabel(frame: .zero)
    
    func setup(local: LocalModel){
        name.text = "Nombre del local: \(local.localName)"
        direction.text = "Direccion: \(local.direction)"
        location.text = "Localidad: \(local.locationName)"        
        prepare()
    }
    
    private func prepare() {
        prepareNameLabel()
        prepareDirectionLabel()
        prepareLocationLabel()
    }
    
    private func prepareNameLabel() {
        name.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(name)
        name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
        name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
    }
    
    private func prepareDirectionLabel() {
        direction.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(direction)
        direction.leadingAnchor.constraint(equalTo: name.leadingAnchor).isActive = true
        direction.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10).isActive = true
        direction.trailingAnchor.constraint(equalTo: name.trailingAnchor).isActive = true
    }
    
    private func prepareLocationLabel() {
        location.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(location)
        location.leadingAnchor.constraint(equalTo: name.leadingAnchor).isActive = true
        location.topAnchor.constraint(equalTo: direction.bottomAnchor, constant: 10).isActive = true
        location.trailingAnchor.constraint(equalTo: name.trailingAnchor).isActive = true
    }
    
    
    override func prepareForReuse() {
        name.removeFromSuperview()
        direction.removeFromSuperview()
        location.removeFromSuperview()
    }
}
