//
//  CourseGradeCalculator.swift
//  GradeMate
//
//  Created by Vince Carpino on 1/2/18.
//  Copyright © 2018 The Half-Blood Jedi. All rights reserved.
//

class CourseGradeCalculator {
    var currentGrade : Float
    var examWeight   : Float
    var examScore    : Float
    var courseGrade  : Float
    
    // MARK: - INITIALIZER
    init() {
        currentGrade = 0.0
        examWeight   = 0.0
        examScore    = 0.0
        courseGrade  = 0.0
    }
    
    func calculate() {
        courseGrade = examWeight * examScore + (1 - examWeight) * currentGrade
    }
    
    // MARK: - GETTERS
    func getCurrentGrade() -> Float {
        return self.currentGrade
    }
    
    func getExamWeight() -> Float {
        return self.examWeight
    }
    
    func getExamScore() -> Float {
        return self.examScore
    }
    
    func getCourseGrade() -> Float {
        return self.courseGrade
    }
    
    // MARK: - SETTERS
    func setCurrentGrade(val : Float) {
        self.currentGrade = val
    }
    
    func setExamWeight(val : Float) {
        self.examWeight = val
    }
    
    func setExamScore(val : Float) {
        self.examScore = val
    }
    
    func setCourseGrade(val : Float) {
        self.courseGrade = val
    }
}

















