//
//  CalendarView.swift
//  Ukraine_russia_War_Dataset_2022
//
//  Created by Andrew  on 8/21/23.
//
import Foundation
import SwiftUI

struct DatePickerView: View {
    
    @ObservedObject var sharedData = SharedDataForDatePicker()
    
    //@State private var selectedDate = Date()
    
//    let startingDate : Date = Calendar.current.date(from: DateComponents(year: 2022, month: 2, day: 25)) ?? Date()
//    let endingDate : Date = Date()
    
    var body: some View {
        VStack {
            DatePicker(
                "Протягом \n 24.02.22 - ",
                selection: $sharedData.selectedDate,
                in: sharedData.dateRange,
                displayedComponents: .date)
                    .tint(Color.yellow)
                    .datePickerStyle(.compact)
                    //.padding(.horizontal, 32)
            
            //Text("\(sharedData.selectedDate)")
            //Text("\(formattedDate(selectedDate: sharedData.selectedDate))")
        }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 90)
    }
            
}
    
struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
