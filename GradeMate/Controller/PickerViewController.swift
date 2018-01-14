//
//  PickerViewController.swift
//  GradeMate
//
//  Created by Vince Carpino on 1/11/18.
//  Copyright © 2018 The Half-Blood Jedi. All rights reserved.
//

import Foundation
import PickerView

class PickerViewController: UIViewController {
    
    // MARK: PICKERVIEWS
    @IBOutlet weak var picker1: PickerView!
    @IBOutlet weak var picker2: PickerView!
    @IBOutlet weak var picker3: PickerView!
    @IBOutlet weak var picker4: PickerView!
    
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
            
            // REMOVE LEADING ZERO ON DECIMAL
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
    
    override func viewDidLoad() {
        configurePicker1()
        configurePicker2()
        configurePicker3()
        configurePicker4()
    }
    
    func configurePicker1() {
        picker1.backgroundColor = .clear
        picker1.dataSource = self
        picker1.delegate   = self
        picker1.currentSelectedRow = stringNumbers1.index(of: "100")
        picker1.selectionStyle = .defaultIndicator
        picker1.scrollingStyle = .default
    }
    
    func configurePicker2() {
        picker2.backgroundColor = .clear
        picker2.dataSource = self
        picker2.delegate   = self
        picker2.currentSelectedRow = stringNumbers2.index(of: "0%")
        picker2.selectionStyle = .none
        picker2.scrollingStyle = .default
    }
    
    func configurePicker3() {
        picker3.backgroundColor = .clear
        picker3.dataSource = self
        picker3.delegate   = self
        picker3.currentSelectedRow = stringNumbers3.index(of: "1%")
        picker3.selectionStyle = .none
        picker3.scrollingStyle = .default
    }
    
    func configurePicker4() {
        picker4.backgroundColor = .clear
        picker4.dataSource = self
        picker4.delegate   = self
        picker4.currentSelectedRow = stringNumbers4.index(of: "100%")
        picker4.selectionStyle = .defaultIndicator
        picker4.scrollingStyle = .default
    }
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
                label.font = UIFont(name: "Courier-Bold", size: 21.0)
            } else {
                label.font = UIFont(name: "Courier-Bold", size: 21.0)
            }
        } else {
            if (highlighted) {
                label.font = UIFont(name: "Courier-Bold", size: 21.0)
            } else {
                label.font = UIFont(name: "Courier-Bold", size: 21.0)
            }
        }
        
        if (highlighted) {
            label.textColor = .white
            let itemTextInt = Int(label.text!)
            let coords = CGPoint(x: 0, y: ((itemTextInt!)-1))
            pickerView.defaultSelectionIndicator.backgroundColor = letterGradientImage?.getPixelColor(pos: coords)
        } else {
            label.textColor = .lightGray
        }
    }
    
    func pickerView(_ pickerView: PickerView, viewForRow row: Int, index: Int, highlighted: Bool, reusingView view: UIView?) -> UIView? {
        return nil
    }
}

extension UIImage {
    func getPixelColor(pos: CGPoint) -> UIColor {
        let pixelData = self.cgImage!.dataProvider?.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4
        
        let r = CGFloat(data[pixelInfo])   / CGFloat(255.0)
        let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
        let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
        let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}

