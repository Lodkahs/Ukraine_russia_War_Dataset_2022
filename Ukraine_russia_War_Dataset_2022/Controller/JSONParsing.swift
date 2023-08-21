//
//  JSONParsing.swift
//  Ukraine_russia_War_Dataset_2022
//
//  Created by Andrew  on 8/21/23.
//

import Foundation

class JSONParsing : ObservableObject {
    
    @Published var lossesArray : [LossesEquipmentModel] = []

    init() {
        readData(fileName: "russia_losses_equipment")
    }
    
    func readData(fileName : String) {
        
        guard let path = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            fatalError("No such file.")
        }
        
        guard let url = try? Data(contentsOf: path) else {
            fatalError("Couldn't convert data.")
        }
        
        let decoder = JSONDecoder()
        guard let data = try? decoder.decode([LossesEquipmentModel].self, from: url) else {
            fatalError("Problem decoding data.")
        }
        
        
        lossesArray = data
        
        //return data
    }
    
    
}
