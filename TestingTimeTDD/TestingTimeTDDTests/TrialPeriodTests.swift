//
//  TrialPeriodTests.swift
//  TestingTimeTDDTests
//
//  Created by Tewodros Mengesha on 16.1.2020.
//  Copyright © 2020 Tewodros Mengesha. All rights reserved.
//

import XCTest

// Test code in your main module when dynamically linking unit tests
//@testable import TestingTimeTDD



class TrialPeriodTests: XCTestCase {
    
    var date: Date!
    var timeTraveler: TimeTraveler!
    var trial: TrialPeriod!

    override func setUp() {
        super.setUp()
        
        date = Date()
        timeTraveler = TimeTraveler(date: date)
        trial = TrialPeriod(dateGenerator: timeTraveler.generateDate)
    }
    
    // All test functions start with the word "test"
    
    /*func testTrialPeriod() {
        // Arrange
        let expected = Date()
        let timeTraveler = TimeTraveler(date: expected)
        let trial = TrialPeriod(dateGenerator: timeTraveler.generateDate)
        
        // Act
        let actualDate = trial.dateInstalled
        
        print("Expected: \(expected.timeIntervalSinceReferenceDate)")
        print("Actual: \(actualDate.timeIntervalSinceReferenceDate)")
        
        // Assert
        XCTAssertEqual(expected, actualDate)
    } */
    
    func testTrialPeriodDateInstalledIsToday() {
        XCTAssertEqual(date, trial.dateInstalled)
     }

     func testDefaultDurationIs7Days() {
        XCTAssertEqual(7, trial.durationInDays)
     }
     
     func testTrialPeriodDateExpiredIs7DaysAfterInstallDate() {
        let expected = Calendar.current.date(byAdding: .day, value: 7, to: date)
        XCTAssertEqual(expected, trial.dateExpired)
     }
    
    func testTrialPeriodNotExpriredOnStart() {
        XCTAssertFalse(trial.isExpired())
    }
    
    func testTrialPeriodExpiredAfter7Days() {
        timeTraveler.timeTravelBy(days: 7)
        
        XCTAssertTrue(trial.isExpired())
    }


}

