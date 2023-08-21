//
//  LossesEquipmentOryxModel.swift
//  Ukraine_russia_War_Dataset_2022
//
//  Created by Andrew  on 8/21/23.
//

import Foundation

struct LossesEquipmentOryxModel : Identifiable, Codable {
    var id = UUID().uuidString
    let equipmentOryx, model, manufacturer, equipmentUA : String
    let lossesTotal : Int

    init(id: String = UUID().uuidString, equipmentOryx: String, model: String, manufacturer: String, equipmentUA: String, lossesTotal: Int) {
        self.id = id
        self.equipmentOryx = equipmentOryx
        self.model = model
        self.manufacturer = manufacturer
        self.equipmentUA = equipmentUA
        self.lossesTotal = lossesTotal
    }
}
