//
//  PickerViewController.swift
//  GradeMate
//
//  Created by Vince Carpino on 1/11/18.
//  Copyright © 2018 The Half-Blood Jedi. All rights reserved.
//

import Foundation
import PickerView

class PickerViewController: PickerViewDataSource, PickerViewDelegate {
    
    let picker1 = PickerView()
    let picker2 = PickerView()
    let picker3 = PickerView()
    let picker4 = PickerView()
    
    var numbers1: [Double]
    var numbers2: [Double]
    var numbers3: [Double]
    var numbers4: [Double]
    
    var stringNumbers1: [String]
    var stringNumbers2: [String]
    var stringNumbers3: [String]
    var stringNumbers4: [String]
    
    // MARK: - INITIALIZER
    init() {
        populateArrays()
    }
    
    
    // MARK: - PICKERVIEW -
    
    // MARK: DATA SOURCE
    func pickerViewNumberOfRows(_ pickerView: PickerView) -> Int {
        return 100
    }
    
    func pickerView(_ pickerView: PickerView, titleForRow row: Int, index: Int) -> String {
        <#code#>
    }
    
    // MARK: DELEGATE
    func pickerViewHeightForRows(_ pickerView: PickerView) -> CGFloat {
        <#code#>
    }
    
    func pickerView(_ pickerView: PickerView, didSelectRow row: Int, index: Int) {
        <#code#>
    }
    
    func pickerView(_ pickerView: PickerView, didTapRow row: Int, index: Int) {
        <#code#>
    }
    
    func pickerView(_ pickerView: PickerView, styleForLabel label: UILabel, highlighted: Bool) {
        <#code#>
    }
    
    func pickerView(_ pickerView: PickerView, viewForRow row: Int, index: Int, highlighted: Bool, reusingView view: UIView?) -> UIView? {
        <#code#>
    }
    
    
    // MARK: - POPULATE ARRAYS
    
    func populateArrays() {
        for i in 0...3 {
            switch i {
            // FIRST COLUMN
            case 0:
                for j in (1...100).reversed() {
                    numbers1.append(Double(j))
                    stringNumbers1.append(String(j))
                }
                
            // SECOND COLUMN
            case 1:
                for j in 0...9 {
                    numbers2.append(Double(j) / 10.0)
                    
                    var stringDecimal = (String(Double(j) / 10.0) + "%")
                    
                    // REMOVE THE LEADING ZERO ON DECIMAL
                    stringDecimal.remove(at: stringDecimal.startIndex)
                    
                    stringNumbers2.append(stringDecimal)
                }
                
            // THIRD COLUMN
            case 2:
                for j in (1...100) {
                    numbers3.append(Double(j))
                    stringNumbers3.append(String(j) + "%")
                }
                
            // FOURTH COLUMN
            case 3:
                for j in (1...100).reversed() {
                    numbers4.append(Double(j))
                    stringNumbers4.append(String(j) + "%")
                }
                
            default:break
            }
        }
    }
}
