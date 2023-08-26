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
        .navigationTitle("🐷🐶 losses during this war:")
        
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
        VStack(alignment: .leading) {
            Text("Manufacturer: \(equipmentNaming.model)")
            Text("Equipment Oryx: \(equipmentNaming.equipmentOryx)")
            Text("Total losses: \(equipmentNaming.lossesTotal)")
            Text("Country: \(equipmentNaming.manufacturer.rawValue)")
            Text("Equipment UA: \(equipmentNaming.equipmentUa.rawValue)")
        }
        .font(.system(size: 16))
        .fontWeight(.medium)
        .padding()
        .border(.white)
        
    }
}
