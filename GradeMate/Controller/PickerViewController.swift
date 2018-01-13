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
    
    let letterGradientImage = UIImage(named: "GradeGradient")
    
    // MARK: - INITIALIZER
    init() {
        populateArrays()
    }
    
    
    // MARK: - PICKERVIEW -
    
    // MARK: DATA SOURCE
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
    
    // MARK: DELEGATE
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
            //            label.textColor = .white
            label.textColor = .clouds()
//            label.textColor = UIColor(red: 237/255, green: 241/255, blue: 242/255, alpha: 1.0)
            pickerView.defaultSelectionIndicator.backgroundColor = letterGradientImage?.getPixelColor(pos: coords)
        } else {
            //            label.textColor = UIColor(red: 161.0/255.0, green: 161.0/255.0, blue: 161.0/255.0, alpha: 1.0)
            //            label.textColor = .white
            label.textColor = .silver()
//            label.textColor = UIColor(red: 190/255, green: 196/255, blue: 200/255, alpha: 1.0)
        }
    }
    
    func pickerView(_ pickerView: PickerView, viewForRow row: Int, index: Int, highlighted: Bool, reusingView view: UIView?) -> UIView? {
        return nil
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
