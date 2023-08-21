//
//  CalendarView.swift
//  Ukraine_russia_War_Dataset_2022
//
//  Created by Andrew  on 8/21/23.
//

import SwiftUI

struct CalendarView: UIViewRepresentable {
    
    var dateInterval : DateInterval {
        let calendar = Calendar.current
        //var start = 
        var timeInterval = 157784760000
//        guard
//            let firstDayOfMonth = calendar.date(from: calendar.dateComponents([.month, .year], from: Date())),
//                let firstDayOfNextMonth = calendar.date(bySetting: .month, value: 1, of: firstDayOfMonth),
//                let lastDayOfNextMonth = calendar.date(bySetting: .day, value: -1, of: firstDayOfNextMonth)
//
//        else {
//            return DateInterval()
//        }
        return DateInterval()
    }
    
    func makeUIView(context: Context) -> UICalendarView {
        let view = UICalendarView()
        view.availableDateRange = dateInterval
        return view
    }
    
    func updateUIView(_ uiView: UICalendarView, context: Context) {
        
    }
}


