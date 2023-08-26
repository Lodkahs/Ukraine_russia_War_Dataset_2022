//
//  SharedDataForDatePicker.swift
//  Ukraine_russia_War_Dataset_2022
//
//  Created by Andrew  on 8/26/23.
//

import Foundation
import SwiftUI

class SharedDataForDatePicker : ObservableObject {
    @Published var selectedDate : Date = Date()
    
    
    var startingDate = Calendar.current.date(from: DateComponents(year: 2022, month: 2, day: 25)) ?? Date()
    var endingDate =  Date()//Calendar.current.date(from: DateComponents(year: 2023, month: 8, day: 10)) ?? Date()
    var dateRange : ClosedRange<Date> { return startingDate...endingDate }
}
