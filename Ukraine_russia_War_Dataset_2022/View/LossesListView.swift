//
//  LossesListView.swift
//  Ukraine_russia_War_Dataset_2022
//
//  Created by Andrew  on 8/21/23.
//

import SwiftUI

struct LossesListView: View {
    @State private var equipment : [LossesEquipmentModel] = []
    @State private var correction : [LossesEquipmentCorrectionModel] = []
    @State private var personell : [LossesPersonnelModel] = []
    @State private var oryx : [LossesEquipmentOryxModel] = []
    
    var body: some View {
        ScrollView {
            Text("sdfsdf")
            
            ForEach(equipment, id: \.date) { loss in
                Text("\(loss.date)")
            }
            
        }
        .onAppear {
            //equipment losses
            if let fetchedData : [LossesEquipmentModel] = readData(fileName: "russia_losses_equipment") {
                self.equipment = fetchedData
            } else {
                print("No data fetched.")
            }
            
            //equipment correction
            if let fetchedData : [LossesEquipmentCorrectionModel] = readData(fileName: "LossesEquipmentCorrectionModel") {
                self.correction = fetchedData
            } else {
                print("No data fetched.")
            }
//
//            //personell losses
//            if let fetchedData : [LossesPersonnelModel] = readData(fileName: "LossesPersonnelModel") {
//                self.personell = fetchedData
//            } else {
//                print("No data fetched.")
//            }
//
//            //oryx
//            if let fetchedData : [LossesEquipmentOryxModel] = readData(fileName: "LossesEquipmentOryxModel") {
//                self.oryx = fetchedData
//            } else {
//                print("No data fetched.")
//            }
            
            
        }
    
    }
}

struct LossesListView_Previews: PreviewProvider {
    static var previews: some View {
        LossesListView()
    }
}

func readData<T: Codable>(fileName : String) -> T? {

        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {

            do {

                let data = try Data(contentsOf: URL(filePath: path), options: .mappedIfSafe)

                let decoder = JSONDecoder()
                let parsedData = try decoder.decode(T.self, from: data)
                
                print(parsedData)
                //formatDate()
                return parsedData

            } catch {
                print("Error parsing JSON from \(fileName): \(error.localizedDescription)")
            }

        }

    return nil

}
