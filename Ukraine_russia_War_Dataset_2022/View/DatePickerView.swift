//
//  CalendarView.swift
//  Ukraine_russia_War_Dataset_2022
//
//  Created by Andrew  on 8/21/23.
//
import Foundation
import SwiftUI

struct DatePickerView: View {
    
    @State private var selectedDate = Date()
    
    let startingDate : Date = Calendar.current.date(from: DateComponents(year: 2022, month: 2, day: 25)) ?? Date()
    let endingDate : Date = Date()
    
    var body: some View {
        VStack {
            DatePicker(
                "Протягом 24.02.22 - ",
                selection: $selectedDate,
                in: startingDate...endingDate,
                displayedComponents: .date)
                    .tint(Color.yellow)
                    .datePickerStyle(.compact)
                    .padding(.horizontal, 33)
        }
            .padding()
    }
            
}
    
struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}

