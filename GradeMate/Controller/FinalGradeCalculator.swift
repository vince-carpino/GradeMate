//
//  FinalGradeCalculator.swift
//  GradeMate
//
//  Created by Vince Carpino on 1/16/18.
//  Copyright © 2018 The Half-Blood Jedi. All rights reserved.
//

class FinalGradeCalculator {
    var currentGrade = 0.0
    var decimalValue = 0.0
    var examWeight   = 0.0
    var desiredGrade = 0.0
    
    
    // MARK: - GETTERS
    func getCurrentGrade() -> Double {
        return self.currentGrade
    }
    
    func getDecimalValue() -> Double {
        return self.decimalValue
    }
    
    func getExamWeight() -> Double {
        return self.examWeight
    }
    
    func getDesiredGrade() -> Double {
        return self.desiredGrade
    }
    
    
    // MARK: - SETTERS
    func setCurrentGrade(val: Double) {
        self.currentGrade = val
    }
    
    func setDecimalValue(val: Double) {
        self.decimalValue = val
    }
    
    func setExamWeight(val: Double) {
        self.examWeight = val
    }
    
    func setDesiredGrade(val: Double) {
        self.desiredGrade = val
    }
}
