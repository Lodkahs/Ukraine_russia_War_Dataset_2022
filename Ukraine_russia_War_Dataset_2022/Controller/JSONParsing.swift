//
//  JSONParsing.swift
//  Ukraine_russia_War_Dataset_2022
//
//  Created by Andrew  on 8/21/23.
//

import Foundation
import SwiftUI

func loadJSON(fileName: String) -> Data? {
    if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            return data
        } catch {
            print("Error loading JSON: \(error)")
        }
    } else {
        print("JSON file not found.")
    }
    return nil
}

func displayJSONData(data: Data, type: String, selectedDate: Date, losses: inout [Losses], selectedLossesOnThisDay: inout [Losses], startingDate: Date) {
    
    let decoder = JSONDecoder()
    do {
        
        if type == "Equipment" {
            
            let equipments = try decoder.decode([LossesEquipmentModel].self, from: data)
            losses = equipments
            print("Losses count from equipments: \(losses.count)")
            
        } else if type == "Personnel" {
            
            let personnel = try decoder.decode([LossesPersonnelModel].self, from: data)
            losses = personnel
            print("Losses count from personnel: \(losses.count)")
            
        }
        //end date
        let formattedDateString = formattedDate(selectedDate: selectedDate)
        //first date
        let formattedStartingDate = formattedDate(selectedDate: startingDate)
        
        //print(formattedDateString)
        
        let filteredItems : [Losses] = losses.filter { item in
            if let equipmentItem = item as? LossesEquipmentModel {
                return equipmentItem.date >= formattedStartingDate && equipmentItem.date <= formattedDateString
            } else if let personnelItem = item as? LossesPersonnelModel {
                return personnelItem.date >= formattedStartingDate && personnelItem.date <= formattedDateString
            } else {
                return false
            }
        }
            
        selectedLossesOnThisDay = filteredItems.filter { item in
            if let equipmentItem = item as? LossesEquipmentModel {
                return equipmentItem.date == formattedDateString
            } else if let personnelItem = item as? LossesPersonnelModel {
                return personnelItem.date == formattedDateString
            } else {
                return false
            }
        }
    } catch {
        print("Error parsing JSON data: \(error)")
    }
}

func formattedDate(selectedDate: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter.string(from: selectedDate)
}

func calculateDifference(selectedDate: Date, losses: [Losses], fieldName : String) -> Int {
    
    let calendar = Calendar.current
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    
    let selectedDateString = formatter.string(from: selectedDate)
    
    if let selectedIndex = losses.firstIndex(where: {$0.date == selectedDateString}) {
        
        let selectedField : Int
        
        if selectedIndex > 0 {
            
            if let equipmentLosses = losses[selectedIndex] as? LossesEquipmentModel {
                
                switch fieldName {
                case "tank":
                    selectedField = equipmentLosses.tank
                case "apc":
                    selectedField = equipmentLosses.apc
                case "fieldArtillery":
                    selectedField = equipmentLosses.fieldArtillery
                case "mrl":
                    selectedField = equipmentLosses.mrl
                case "antiAircraftWarfare":
                    selectedField = equipmentLosses.antiAircraftWarfare
                case "aircraft":
                    selectedField = equipmentLosses.aircraft ?? 0
                case "helicopter":
                    selectedField = equipmentLosses.helicopter
                case "drone":
                    selectedField = equipmentLosses.drone
                case "cruiseMissiles":
                    selectedField = equipmentLosses.cruiseMissiles ?? 0
                case "navalShip":
                    selectedField = equipmentLosses.navalShip
                case "militaryAuto":
                    selectedField = equipmentLosses.militaryAuto ?? 0
                case "fuelTank":
                    selectedField = equipmentLosses.fuelTank ?? 0
                case "vehiclesAndFuelTanks":
                    selectedField = equipmentLosses.vehiclesAndFuelTanks ?? 0
                case "specialEquipment":
                    selectedField = equipmentLosses.specialEquipment ?? 0
                case "mobileSRBMSystem":
                    selectedField = equipmentLosses.mobileSRBMSystem ?? 0
                //case "greatestLossesDirection":
                    //selectedField = equipmentLosses.greatestLossesDirection
                    //greatestLossesDirection
                default:
                    selectedField = 0
                }
            } else if let personnelLosses = losses[selectedIndex] as? LossesPersonnelModel {
                switch fieldName {
                case "personnel":
                    selectedField = personnelLosses.personnel
                case "pow":
                    selectedField = personnelLosses.pow ?? 0
                default:
                    selectedField = 0
                }
            } else {
                selectedField = 0
            }
            
            let previousDate = formatter.date(from: selectedDateString)!
            let previousDateString = formatter.string(from: calendar.date(byAdding: .day, value: -1, to: previousDate)!)
            
            if let previousIndex = losses.firstIndex(where: {$0.date == previousDateString }) {
                let previousEquipment : Int
                
                if let equipmentLosses = losses[previousIndex] as? LossesEquipmentModel {
                    switch fieldName {
                    case "tank":
                        previousEquipment = equipmentLosses.tank
                    case "apc":
                        previousEquipment = equipmentLosses.apc
                    case "fieldArtillery":
                        previousEquipment = equipmentLosses.fieldArtillery
                    case "mrl":
                        previousEquipment = equipmentLosses.mrl
                    case "antiAircraftWarfare":
                        previousEquipment = equipmentLosses.antiAircraftWarfare
                    case "aircraft":
                        previousEquipment = equipmentLosses.aircraft ?? 0
                    case "helicopter":
                        previousEquipment = equipmentLosses.helicopter
                    case "drone":
                        previousEquipment = equipmentLosses.drone
                    case "cruiseMissiles":
                        previousEquipment = equipmentLosses.cruiseMissiles ?? 0
                    case "navalShip":
                        previousEquipment = equipmentLosses.navalShip
                    case "militaryAuto":
                        previousEquipment = equipmentLosses.militaryAuto ?? 0
                    case "fuelTank":
                        previousEquipment = equipmentLosses.fuelTank ?? 0
                    case "vehiclesAndFuelTanks":
                        previousEquipment = equipmentLosses.vehiclesAndFuelTanks ?? 0
                    case "specialEquipment":
                        previousEquipment = equipmentLosses.specialEquipment ?? 0
                    case "mobileSRBMSystem":
                        previousEquipment = equipmentLosses.mobileSRBMSystem ?? 0
                    default:
                        previousEquipment = 0
                    }
                } else if let personnelLosses = losses[previousIndex] as? LossesPersonnelModel {
                    switch fieldName {
                    case "personnel":
                        previousEquipment = personnelLosses.personnel
                    case "pow":
                        previousEquipment = personnelLosses.pow ?? 0
                    default:
                        previousEquipment = 0
                    }
                } else {
                    previousEquipment = 0
            }
                
                return selectedField - previousEquipment
            
            }
            
        }
            
             else {
                 if let equipmentLosses = losses[selectedIndex] as? LossesEquipmentModel {
                     
                     switch fieldName {
                     case "tank":
                         selectedField = equipmentLosses.tank
                     case "apc":
                         selectedField = equipmentLosses.apc
                     case "fieldArtillery":
                         selectedField = equipmentLosses.fieldArtillery
                     case "mrl":
                         selectedField = equipmentLosses.mrl
                     case "antiAircraftWarfare":
                         selectedField = equipmentLosses.antiAircraftWarfare
                     case "aircraft":
                         selectedField = equipmentLosses.aircraft ?? 0
                     case "helicopter":
                         selectedField = equipmentLosses.helicopter
                     case "drone":
                         selectedField = equipmentLosses.drone
                     case "cruiseMissiles":
                         selectedField = equipmentLosses.cruiseMissiles ?? 0
                     case "navalShip":
                         selectedField = equipmentLosses.navalShip
                     case "militaryAuto":
                         selectedField = equipmentLosses.militaryAuto ?? 0
                     case "fuelTank":
                         selectedField = equipmentLosses.fuelTank ?? 0
                     case "vehiclesAndFuelTanks":
                         selectedField = equipmentLosses.vehiclesAndFuelTanks ?? 0
                     case "specialEquipment":
                         selectedField = equipmentLosses.specialEquipment ?? 0
                     case "mobileSRBMSystem":
                         selectedField = equipmentLosses.mobileSRBMSystem ?? 0
                     //case "greatestLossesDirection":
                         //selectedField = equipmentLosses.greatestLossesDirection
                         //greatestLossesDirection
                     default:
                         selectedField = 0
                     }
                 } else if let personnelLosses = losses[selectedIndex] as? LossesPersonnelModel {
                     switch fieldName {
                     case "personnel":
                         selectedField = personnelLosses.personnel
                     case "pow":
                         selectedField = personnelLosses.pow ?? 0
                     default:
                         selectedField = 0
                     }
                 } else {
                     selectedField = 0
                 }
        }
    }
    
    return 0
    
}

