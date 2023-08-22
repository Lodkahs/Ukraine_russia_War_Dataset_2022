//
//  LossesEquipmentCorrectionModel.swift
//  Ukraine_russia_War_Dataset_2022
//
//  Created by Andrew  on 8/21/23.
//

import Foundation

struct LossesEquipmentCorrectionModel: Codable, Hashable {
    let date: String
    let day, aircraft, helicopter, tank: Int
    let apc, fieldArtillery, mrl, drone: Int
    let navalShip, antiAircraftWarfare, specialEquipment, vehiclesAndFuelTanks: Int
    let cruiseMissiles: Int

    enum CodingKeys: String, CodingKey {
        case date, day, aircraft, helicopter, tank
        case apc = "APC"
        case fieldArtillery = "field artillery"
        case mrl = "MRL"
        case drone
        case navalShip = "naval ship"
        case antiAircraftWarfare = "anti-aircraft warfare"
        case specialEquipment = "special equipment"
        case vehiclesAndFuelTanks = "vehicles and fuel tanks"
        case cruiseMissiles = "cruise missiles"
    }
}

typealias LossesEquipmentCorrectionModelArray = [LossesEquipmentCorrectionModel]
