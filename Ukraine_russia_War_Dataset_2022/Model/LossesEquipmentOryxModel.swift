//
//  LossesEquipmentOryxModel.swift
//  Ukraine_russia_War_Dataset_2022
//
//  Created by Andrew  on 8/21/23.
//

import Foundation

struct LossesEquipmentOryxModel : Identifiable {
    let id = UUID().uuidString
    let equipmentOryx : String
    let model : String
    let manufacturer : String
    let lossesTotal : Int
    let equipmentUA : String

    init(
        equipmentOryx : String,
        model: String,
        manufacturer: String,
        lossesTotal : Int,
        equipmentUA : String
    ) {
        self.equipmentOryx = equipmentOryx
        self.model = model
        self.manufacturer = manufacturer
        self.lossesTotal = lossesTotal
        self.equipmentUA = equipmentUA
    }
}
