//
//  TimeTraveler.swift
//  TestingTimeTDDTests
//
//  Created by Tewodros Mengesha on 16.1.2020.
//  Copyright © 2020 Tewodros Mengesha. All rights reserved.
//

import Foundation

class TimeTraveler {
    var date: Date
    
    init(date: Date = Date()) {
        self.date = date
    }
    
    func generateDate() -> Date {
        return date
    }
    
    func timeTravelBy(seconds: TimeInterval) {
        date = date.addingTimeInterval(seconds)
    }
    
    func timeTravelBy(days: Int) {
        date = Calendar.current.date(byAdding: .day, value: days, to: date)!
    }
}
