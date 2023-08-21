//
//  LossesPersonnelModel.swift
//  Ukraine_russia_War_Dataset_2022
//
//  Created by Andrew  on 8/21/23.
//

import Foundation

struct LossesPersonnelModel : Identifiable {
    
    let id = UUID().uuidString
    let date : String
    let day : Int
    var personnel : Int
    var pow : Int? = nil
    
    init(
        date: String,
        day: Int,
        personnel: Int,
        pow : Int? = nil
    ) {
        self.date = date
        self.day = day
        self.personnel = personnel
        self.pow = pow
    }
}
