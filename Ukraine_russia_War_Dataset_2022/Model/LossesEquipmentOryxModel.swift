//
//  LossesEquipmentOryxModel.swift
//  Ukraine_russia_War_Dataset_2022
//
//  Created by Andrew  on 8/21/23.
//

import Foundation

protocol Oryx : Hashable {
    var model : String { get }
}

struct LossesEquipmentOryxModel: Codable, Oryx {

    let equipmentOryx, model: String
    let manufacturer: Manufacturer
    let lossesTotal: Int
    let equipmentUa: EquipmentUa

    enum CodingKeys: String, CodingKey {
        case equipmentOryx = "equipment_oryx"
        case model, manufacturer
        case lossesTotal = "losses_total"
        case equipmentUa = "equipment_ua"
    }
}

enum EquipmentUa: String, Codable {
    case aircrafts = "Aircrafts"
    case antiAircraftWarfareSystems = "Anti-aircraft Warfare Systems"
    case armouredPersonnelCarriers = "Armoured Personnel Carriers"
    case artillerySystems = "Artillery Systems"
    case helicopters = "Helicopters"
    case multipleRocketLaunchers = "Multiple Rocket Launchers"
    case specialEquipment = "Special Equipment"
    case tanks = "Tanks"
    case unmannedAerialVehicles = "Unmanned Aerial Vehicles"
    case vehicleAndFuelTank = "Vehicle and Fuel Tank"
    case warshipsBoats = "Warships, Boats"
}

enum Manufacturer: String, Codable {
    case iran = "Iran"
    case israel = "Israel"
    case italy = "Italy"
    case poland = "Poland"
    case russia = "Russia"
    case theCzechRepublic = "the Czech Republic"
    case theSovietUnion = "the Soviet Union"
}

typealias LossesEquipmentOryxModelArray = [LossesEquipmentOryxModel]
