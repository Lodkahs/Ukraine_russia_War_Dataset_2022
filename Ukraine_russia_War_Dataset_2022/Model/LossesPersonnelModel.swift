//
//  LossesPersonnelModel.swift
//  Ukraine_russia_War_Dataset_2022
//
//  Created by Andrew  on 8/21/23.
//

import Foundation

struct LossesPersonnelModel: Losses {
    
    var tank: Int?

    let date: String
    let day, personnel: Int
    let welcomePersonnel: Personnel
    let pow: Int?

    enum CodingKeys: String, CodingKey {
        case date, day, personnel
        case welcomePersonnel = "personnel*"
        case pow = "POW"
    }

}

enum Personnel: String, Codable {
    case about = "about"
    case more = "more"
}

typealias LossesPersonnelModelArray = [LossesPersonnelModel]
