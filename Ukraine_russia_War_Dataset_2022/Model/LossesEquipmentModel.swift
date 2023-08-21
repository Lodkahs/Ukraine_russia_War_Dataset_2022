//
//  LossesEquipmentModel.swift
//  Ukraine_russia_War_Dataset_2022
//
//  Created by Andrew  on 8/21/23.
//

import Foundation

struct EquipmentModel : Identifiable {
    let id = UUID().uuidString
    let date : String
    let day : Int
    var aircraft : Int
    var helicopter : Int
    var tank : Int
    var apc : Int
    var fieldArtillery : Int
    var mrl : Int
    var militaryAuto : Int? = nil
    var fuelTank : Int? = nil
    var drone : Int
    var navalShip : Int
    var antiAircraftWarfare : Int
    
    //additional options
    var cruiseMissile : Int? = nil
    var vehiclesAndFuelTanks : Int? = nil
    var specialEquipment : Int? = nil
    
    //++ options
    var mobileSrbmSystem : Int? = nil
    var greatestLossesDirection : String? = nil
    
    init(
        date: String,
        day: Int,
        aircraft: Int,
        helicopter: Int,
        tank: Int, apc: Int,
        fieldArtillery: Int,
        mrl: Int,
        militaryAuto: Int? = nil,
        fuelTank: Int? = nil,
        drone: Int,
        navalShip: Int,
        antiAircraftWarfare: Int,
        cruiseMissile: Int? = nil,
        vehiclesAndFuelTanks: Int? = nil,
        specialEquipment: Int? = nil,
        mobileSrbmSystem: Int? = nil,
        greatestLossesDirection: String? = nil) {
            
            self.date = date
            self.day = day
            self.aircraft = aircraft
            self.helicopter = helicopter
            self.tank = tank
            self.apc = apc
            self.fieldArtillery = fieldArtillery
            self.mrl = mrl
            self.militaryAuto = militaryAuto
            self.fuelTank = fuelTank
            self.drone = drone
            self.navalShip = navalShip
            self.antiAircraftWarfare = antiAircraftWarfare
            self.cruiseMissile = cruiseMissile
            self.vehiclesAndFuelTanks = vehiclesAndFuelTanks
            self.specialEquipment = specialEquipment
            self.mobileSrbmSystem = mobileSrbmSystem
            self.greatestLossesDirection = greatestLossesDirection
            
    }
    
}
