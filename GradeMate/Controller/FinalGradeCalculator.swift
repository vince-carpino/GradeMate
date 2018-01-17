//
//  FinalGradeCalculator.swift
//  GradeMate
//
//  Created by Vince Carpino on 1/16/18.
//  Copyright © 2018 The Half-Blood Jedi. All rights reserved.
//

protocol FinalGradeCalculator {
    var currentGrade: Double { get set }
    var decimalValue: Double { get set }
    var examWeight:   Double { get set }
    var desiredGrade: Double { get set }
}
