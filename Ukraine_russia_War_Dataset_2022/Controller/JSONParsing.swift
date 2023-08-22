//
//  JSONParsing.swift
//  Ukraine_russia_War_Dataset_2022
//
//  Created by Andrew  on 8/21/23.
//

import Foundation

//class JSONParsing : ObservableObject {
    
//    @Published var lossesEquipmentArray : LossesEquipmentModelArray = []
//    @Published var lossesEquipmentCorrectionArray : LossesEquipmentCorrectionModelArray = []
//    @Published var lossesEquipmentOryxArray : LossesEquipmentOryxModelArray = []
//    @Published var lossesPersonnelArray : LossesPersonnelModelArray = []
//
//    init() {
//            self.lossesEquipmentArray = self.readData(fileName: "russia_losses_equipment", as: LossesEquipmentModelArray.self) ?? LossesEquipmentModelArray()
//            self.lossesPersonnelArray = self.readData(fileName: "russia_losses_personnel", as: LossesPersonnelModelArray.self) ?? LossesPersonnelModelArray()
//            self.lossesEquipmentOryxArray = self.readData(fileName: "russia_losses_equipment_oryx", as: LossesEquipmentOryxModelArray.self) ?? LossesEquipmentOryxModelArray()
//            self.lossesEquipmentCorrectionArray = self.readData(fileName: "russia_losses_equipment_correction", as: LossesEquipmentCorrectionModelArray.self) ?? LossesEquipmentCorrectionModelArray()
//
//   }
        
//    func readData<T: Codable>(fileName : String) -> T? {
//
//            if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
//
//                do {
//
//                    let data = try Data(contentsOf: URL(filePath: path), options: .mappedIfSafe)
//
//                    let decoder = JSONDecoder()
//                    let parsedData = try decoder.decode(T.self, from: data)
//
//                    print(parsedData)
//                    //formatDate()
//                    return parsedData
//
//                } catch {
//                    print("Error parsing JSON from \(fileName): \(error.localizedDescription)")
//                }
//
//            }
//
//        return nil
//
//    }


        
    func formatDate() {
            
            let formatterInput = DateFormatter()
            formatterInput.dateFormat = "yyyy-MM-dd"
            
            let formatterOutput = DateFormatter()
            formatterOutput.dateFormat = "dd.MM.yyyy"
                
                
                
    
//            for var time in lossesEquipmentArray {
//
//                let ch = Character("-")
//                var result = time.date.split(separator: ch)
//
//                result.reverse()
//                var final = result.joined(separator: ".")
//
//                time.date = final
//            }

        }
        
 //   }




