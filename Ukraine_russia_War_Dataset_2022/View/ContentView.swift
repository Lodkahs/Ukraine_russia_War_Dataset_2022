//
//  ContentView.swift
//  Ukraine_russia_War_Dataset_2022
//
//  Created by Andrew  on 8/21/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var vm = JSONParsing()
    
    @State private var selectedDate = Date()
    var body: some View {
        ScrollView {
            VStack {
                Text("генеральний штаб зс україни")
                Text("інформує")
                    .font(.largeTitle)
            }
                .textCase(.uppercase)
        
            DatePickerView()
                //.padding(.horizontal, 0)
                .border(.black)
            
            Text("ОРІЄНТОВНІ ВТРАТИ ПРОТИВНИКА СКЛАЛИ:")
            
            LossesListView()
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //LossesListView()
    }
}
