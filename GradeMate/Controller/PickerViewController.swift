//
//  PickerViewController.swift
//  GradeMate
//
//  Created by Vince Carpino on 1/11/18.
//  Copyright © 2018 The Half-Blood Jedi. All rights reserved.
//

import Foundation
import FlatUIKit
import PickerView

class PickerViewController {

    // MARK: PICKERVIEWS
    let picker1 = PickerView()
    let picker2 = PickerView()
    let picker3 = PickerView()
    let picker4 = PickerView()
    
    // MARK: NUMBER ARRAYS
    let numbers1: [Double] = {
        var nums = [Double]()
        
        for i in (1...100).reversed() {
            nums.append(Double(i))
        }
        
        return nums
    }()
    
    let numbers2: [Double] = {
        var nums = [Double]()
        
        for i in 0...9 {
            nums.append(Double(i) / 10.0)
        }
        
        return nums
    }()
    
    let numbers3: [Double] = {
        var nums = [Double]()
        
        for i in 1...100 {
            nums.append(Double(i))
        }
        
        return nums
    }()
    
    let numbers4: [Double] = {
        var nums = [Double]()
        
        for i in 1...100 {
            nums.append(Double(i))
        }
        
        return nums
    }()
    
    // MARK: STRING ARRAYS
    let stringNumbers1: [String] = {
        var strNums = [String]()
        
        for i in (1...100).reversed() {
            strNums.append(String(i))
        }
        
        return strNums
    }()
    
    let stringNumbers2: [String] = {
        var strNums = [String]()
        
        for i in 0...9 {
            var stringDecimal = (String(Double(i) / 10.0) + "%")
            
            // REMOVE THE LEADING ZERO ON DECIMAL
            stringDecimal.remove(at: stringDecimal.startIndex)
            
            strNums.append(stringDecimal)
        }
        
        return strNums
    }()
    
    let stringNumbers3: [String] = {
        var strNums = [String]()
        
        for i in 1...100 {
            strNums.append(String(i) + "%")
        }
        
        return strNums
    }()
    
    let stringNumbers4: [String] = {
        var strNums = [String]()
        
        for i in (1...100).reversed() {
            strNums.append(String(i) + "%")
        }
        
        return strNums
    }()
    
    // MARK: GRADIENT IMAGE
    let letterGradientImage = UIImage(named: "GradeGradient")
}

// MARK: - PICKERVIEW -

// MARK: DATA SOURCE
extension PickerViewController: PickerViewDataSource {
    
    func pickerViewNumberOfRows(_ pickerView: PickerView) -> Int {
        switch pickerView {
        case picker1:
            return numbers1.count
        case picker2:
            return numbers1.count
        case picker3:
            return numbers1.count
        case picker4:
            return numbers1.count
        default: return 0
        }
    }
    
    func pickerView(_ pickerView: PickerView, titleForRow row: Int, index: Int) -> String {
        switch pickerView {
        case picker1:
            return stringNumbers1[index]
        case picker2:
            return stringNumbers2[index]
        case picker3:
            return stringNumbers3[index]
        case picker4:
            return stringNumbers4[index]
        default: return ""
        }
    }
}

// MARK: DELEGATE
extension PickerViewController: PickerViewDelegate {
    
    func pickerViewHeightForRows(_ pickerView: PickerView) -> CGFloat {
        return 50.0
    }
    
    func pickerView(_ pickerView: PickerView, didSelectRow row: Int, index: Int) {
        switch pickerView {
        case picker1:
            print(stringNumbers1[index])
        case picker2:
            print(stringNumbers2[index])
        case picker3:
            print(stringNumbers3[index])
        case picker4:
            print(stringNumbers4[index])
        default:break
        }
    }
    
    func pickerView(_ pickerView: PickerView, didTapRow row: Int, index: Int) {
        print("Row \(row) tapped")
    }
    
    func pickerView(_ pickerView: PickerView, styleForLabel label: UILabel, highlighted: Bool) {
        label.textAlignment = .center
        if #available(iOS 8.2, *) {
            if (highlighted) {
                label.font = UIFont.systemFont(ofSize: 21.0, weight: UIFont.Weight.light)
            } else {
                label.font = UIFont.systemFont(ofSize: 21.0, weight: UIFont.Weight.light)
            }
        } else {
            if (highlighted) {
                label.font = UIFont(name: "Courier-Bold", size: 21.0)
            } else {
                label.font = UIFont(name: "Courier-Bold", size: 21.0)
            }
        }
        
        if (highlighted) {
            let itemTextInt = Int(label.text!)
            let coords = CGPoint(x: 0, y: ((itemTextInt!)-1))
            label.textColor = .clouds()
            pickerView.defaultSelectionIndicator.backgroundColor = letterGradientImage?.getPixelColor(pos: coords)
        } else {
            label.textColor = .silver()
        }
    }
    
    func pickerView(_ pickerView: PickerView, viewForRow row: Int, index: Int, highlighted: Bool, reusingView view: UIView?) -> UIView? {
        return nil
    }
}
