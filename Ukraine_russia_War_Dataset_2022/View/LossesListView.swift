//
//  LossesListView.swift
//  Ukraine_russia_War_Dataset_2022
//
//  Created by Andrew  on 8/21/23.
//

import SwiftUI

struct LossesListView: View {
    @ObservedObject var vm = JSONParsing()
    var body: some View {
        List {
            ForEach(vm.lossesArray, id: \.self) { l in
                Text(l.date)
            }
        }
        
    }
}

struct LossesListView_Previews: PreviewProvider {
    static var previews: some View {
        LossesListView()
    }
}
