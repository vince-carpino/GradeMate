//
//  CourseGradeCalculator.swift
//  GradeMate
//
//  Created by Vince Carpino on 1/2/18.
//  Copyright © 2018 The Half-Blood Jedi. All rights reserved.
//

class CourseGradeCalculator {
    var currentGrade = 0.0
    var examWeight   = 0.0
    var examScore    = 0.0
    var courseGrade  = 0.0
    
    // MARK: - CALCULATE COURSE GRADE
    func calculate() {
        courseGrade = examWeight * examScore + (1 - examWeight) * currentGrade
    }
    
    // MARK: - GETTERS
    func getCurrentGrade() -> Double {
        return self.currentGrade
    }
    
    func getExamWeight() -> Double {
        return self.examWeight
    }
    
    func getExamScore() -> Double {
        return self.examScore
    }
    
    func getCourseGrade() -> Double {
        return self.courseGrade
    }
    
    // MARK: - SETTERS
    func setCurrentGrade(val: Double) {
        self.currentGrade = val
    }
    
    func setExamWeight(val: Double) {
        self.examWeight = val
    }
    
    func setExamScore(val: Double) {
        self.examScore = val
    }
    
    func setCourseGrade(val: Double) {
        self.courseGrade = val
    }
}
