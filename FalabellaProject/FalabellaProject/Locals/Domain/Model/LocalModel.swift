//
//  LocalModel.swift
//  FalabellaProject
//
//  Created by Nelson Ramirez on 7/7/19.
//  Copyright © 2019 Nelson. All rights reserved.
//

struct LocalModel: Codable {
    let date: String
    let localId: String
    let localName: String
    let commune: String
    let locationName: String
    let direction: String
    let startTime: String
    let endTime: String
    let phone: String
 
    private enum CodingKeys: String, CodingKey {
        case date = "fecha"
        case localId = "local_id"
        case localName = "local_nombre"
        case commune = "comuna_nombre"
        case locationName = "localidad_nombre"
        case direction = "local_direccion"
        case startTime = "funcionamiento_hora_apertura"
        case endTime = "funcionamiento_hora_cierre"
        case phone = "local_telefono"
    }
}
