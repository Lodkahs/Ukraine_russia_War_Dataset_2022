//
//  LossesEquipmentModel.swift
//  Ukraine_russia_War_Dataset_2022
//
//  Created by Andrew  on 8/21/23.
//

import Foundation

struct LossesEquipmentModel: Losses {
    var date: String
    var day: Int
    var tank: Int
    var aircraft: Int?
    var helicopter: Int
    
    var apc: Int
    var fieldArtillery: Int
    var mrl: Int
    var militaryAuto: Int?
    var fuelTank: Int?
    var drone: Int
    var navalShip: Int
    var antiAircraftWarfare: Int
    var specialEquipment: Int?
    var mobileSRBMSystem: Int?
    var greatestLossesDirection: String?
    var vehiclesAndFuelTanks: Int?
    var cruiseMissiles: Int?
    
    enum CodingKeys: String, CodingKey {
        case date, day, aircraft, helicopter, tank
        case apc = "APC"
        case fieldArtillery = "field artillery"
        case mrl = "MRL"
        case militaryAuto = "military auto"
        case fuelTank = "fuel tank"
        case drone
        case navalShip = "naval ship"
        case antiAircraftWarfare = "anti-aircraft warfare"
        case specialEquipment = "special equipment"
        case mobileSRBMSystem = "mobile SRBM system"
        case greatestLossesDirection = "greatest losses direction"
        case vehiclesAndFuelTanks = "vehicles and fuel tanks"
        case cruiseMissiles = "cruise missiles"
    }
}

typealias LossesEquipmentModelArray = [LossesEquipmentModel]
