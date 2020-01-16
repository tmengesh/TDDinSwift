//
//  TrialPeriod.swift
//  TestingTimeTDD
//
//  Created by Tewodros Mengesha on 16.1.2020.
//  Copyright © 2020 Tewodros Mengesha. All rights reserved.
//

import Foundation

typealias  DateGenerator = () -> Date

class TrialPeriod {
    static let defaultDuration = 7
    var dateInstalled: Date
    var dateGenerator: DateGenerator
    var durationInDays: Int
    var dateExpired: Date {
        return Calendar.current.date(byAdding: .day,
                                     value: TrialPeriod.defaultDuration,
                                     to: dateInstalled)!
    }
    
    init(dateGenerator: @escaping DateGenerator = Date.init) {
        self.dateInstalled = dateGenerator()
        self.dateGenerator = dateGenerator
        self.durationInDays = TrialPeriod.defaultDuration
    }
    
    func isExpired() -> Bool {
        let currentDate = dateGenerator()
        if currentDate >= dateExpired {
            return true
        }
        return false
    }
}
