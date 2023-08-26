//
//  DetailView.swift
//  Ukraine_russia_War_Dataset_2022
//
//  Created by Andrew  on 8/25/23.
//

import SwiftUI

struct DetailView: View {
    @Environment (\.dismiss) var dismiss
    
    //@State private var lossesArray : [
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).navigationBarBackButtonHidden(true)
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
