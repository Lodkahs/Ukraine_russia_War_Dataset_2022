//
//  DetailView.swift
//  Ukraine_russia_War_Dataset_2022
//
//  Created by Andrew  on 8/25/23.
//

import SwiftUI

struct DetailView: View {
    
    @Environment (\.dismiss) var dismiss
    
    var itemFromOryxLosses : [LossesEquipmentOryxModel] = []
    var item : String = ""
    var item2 : String? = nil
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(itemFromOryxLosses, id: \.model) { loss in
                    
                    if loss.equipmentUa.rawValue == item {
                        Item(equipmentNaming: loss)
                    }
                    if loss.equipmentUa.rawValue == item2 {
                        Item(equipmentNaming: loss)
                    }
                    
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Losses:")
        
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                    Text("Back")
                }
            }
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}

struct Item : View {
    let equipmentNaming : LossesEquipmentOryxModel
    
    var body: some View {
        VStack {
            Text("Manufacturer : \(equipmentNaming.model)")
            Text("equipmentOryx : \(equipmentNaming.equipmentOryx)")
            Text("lossesTotal : \(equipmentNaming.lossesTotal)")
            Text("manufacturer : \(equipmentNaming.manufacturer.rawValue)")
            Text("equipmentUa : \(equipmentNaming.equipmentUa.rawValue)")
        }
        .padding()
        .border(.black)
        
    }
}
