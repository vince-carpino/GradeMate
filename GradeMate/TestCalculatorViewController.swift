//
//  TestCalculatorViewController.swift
//  GradeMate
//
//  Created by Vince Carpino on 10/14/16.
//  Copyright © 2016 The Half-Blood Jedi. All rights reserved.
//

import UIKit

class TestCalculatorViewController: UIViewController, UIPickerViewDelegate
{
    @IBOutlet weak var gradeMateLabel5s: UILabel!
    @IBOutlet weak var gradeMateLabel6s: UILabel!
    @IBOutlet weak var gradeMateLabel6Plus: UILabel!
    
    @IBOutlet weak var currentGradeButton: UIButton!
    @IBOutlet weak var testAverageButton: UIButton!
    @IBOutlet weak var testWeightButton: UIButton!
    @IBOutlet weak var desiredGradeButton: UIButton!
    
    
    var currentGrade = 0.0;
    var decimalValue = 0.0;
    var testAverage = 0.0;
    var testWeight = 0.0;
    var desiredGrade = 0;
    
    var scoreValue = 0.0;
    
    
    // Numbers that will go into the PickerView
    var numbers: [[Double]] = [[], [], [], [], []]
    var stringNumbers: [[String]] = [[], [], [], [], []]
    
    var numberOfTestsTaken = 0;
    
    
    var bounds = UIScreen.main.bounds
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        checkScreenSize()
        
        currentGradeButton.titleLabel?.textAlignment = NSTextAlignment.center
        testAverageButton.titleLabel?.textAlignment = NSTextAlignment.center
        testWeightButton.titleLabel?.textAlignment = NSTextAlignment.center
        desiredGradeButton.titleLabel?.textAlignment = NSTextAlignment.center
        
        populateArrays()
        populateStringArrays()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Picker View
    
    // Number of columns in the PickerView
    func numberOfComponentsInPickerView(_ pickerView: UIPickerView) -> Int
    {
        return stringNumbers.count
    }
    
    
    // Number of items in each column
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return stringNumbers[component].count
    }
    
    
    // Label for each component
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return stringNumbers[component][row]
    }
    
    
    // Gets the numbers that are selected in each row and column
    /*func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        setCurrentGrade(numbers[0][pickerView.selectedRow(inComponent: 0)])
        setDecimalValue(numbers[1][pickerView.selectedRow(inComponent: 1)])
        setExamWeight(numbers[2][pickerView.selectedRow(inComponent: 2)])
        setDesiredGrade(numbers[3][pickerView.selectedRow(inComponent: 3)])
    }*/
    
    
    // Sizing each column
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat
    {
        switch (component)
        {
        // Current Grade
        case 0:
            return bounds.width / 6.53
            
        // Current Decimal
        case 1:
            return bounds.width / 6.66
            
        // Test Average
        case 2:
            return bounds.width / 4.77
            
        // Test Weight
        case 3:
            return bounds.width / 4.77
            
        // Desired Grade
        case 4:
            return bounds.width / 4.77
            
        default:break
        }
        
        return 0
    }
    
    
    
    // MARK: - Getters
    
    fileprivate func getCurrentGrade() -> Double
    {
        return self.currentGrade
    }
    
    fileprivate func getDecimalValue() -> Double
    {
        return self.decimalValue
    }
    
    fileprivate func getExamWeight() -> Double
    {
        return self.testWeight
    }
    
    fileprivate func getDesiredGrade() -> Int
    {
        return self.desiredGrade
    }
    
    fileprivate func getScoreValue() -> Double
    {
        return self.scoreValue
    }
    
    
    // MARK: - Setters
    
    fileprivate func setCurrentGrade(_ value: Double)
    {
        self.currentGrade = value
    }
    
    fileprivate func setDecimalValue(_ value: Double)
    {
        self.decimalValue = value
    }
    
    fileprivate func setExamWeight(_ value: Double)
    {
        self.testWeight = value
    }
    
    fileprivate func setDesiredGrade(_ value: Double)
    {
        self.desiredGrade = Int(value)
    }
    
    fileprivate func setScoreValue(_ value: Double)
    {
        self.scoreValue = value;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    // MARK: - Populating Number Arrays
    
    func populateArrays()
    {
        for i in 0...4
        {
            switch(i)
            {
            // First column
            case 0:
                for j in (1...100).reversed()
                {
                    numbers[i].append(Double(j))
                }
                
            // Second column
            case 1:
                for j in 0...9
                {
                    numbers[i].append(Double(j) / 10.0)
                }
                
            // Third column
            case 2:
                for j in (1...100).reversed()
                {
                    numbers[i].append(Double(j))
                }
                
            // Fourth column
            case 3:
                for j in (1...100)
                {
                    numbers[i].append(Double(j))
                }
                
            // Fifth column
            case 4:
                for j in (1...100).reversed()
                {
                    numbers[i].append(Double(j))
                }
                
            default:break
            }
        }
    }
    
    
    // MARK: - Populating String Arrays
    
    func populateStringArrays()
    {
        for i in 0...4
        {
            switch(i)
            {
            // First column
            case 0:
                for j in (1...100).reversed()
                {
                    stringNumbers[i].append(String(j))
                }
                
            // Second column
            case 1:
                for j in 0...9
                {
                    var stringDecimal = (String(Double(j) / 10.0) + "%")
                    
                    // Remove the leading zero on dcimal
                    stringDecimal.remove(at: stringDecimal.startIndex)
                    
                    stringNumbers[i].append(stringDecimal)
                }
                
            // Third column
            case 2:
                for j in (1...100).reversed()
                {
                    stringNumbers[i].append(String(j) + "%")
                }
                
            // Fourth column
            case 3:
                for j in (1...100)
                {
                    stringNumbers[i].append(String(j) + "%")
                }
                
            // Fifth column
            case 4:
                for j in (1...100).reversed()
                {
                    stringNumbers[i].append(String(j) + "%")
                }
                
            default:break
            }
        }
    }
    
    
    // MARK: - Checking Screen Size
    
    func checkScreenSize()
    {
        let screenHeight = UIScreen.main.bounds.size.height
        
        // Hide GradeMate label for iPhone 4s
        switch (screenHeight)
        {
        // iPhone 4
        case (480):
            self.gradeMateLabel5s.isHidden = true
            self.gradeMateLabel6s.isHidden = true
            self.gradeMateLabel6Plus.isHidden = true
            
            break
            
        // iPhone 5
        case (568):
            self.gradeMateLabel6s.isHidden = true
            self.gradeMateLabel6Plus.isHidden = true
            
            break
            
        // iPhone 6
        case (667):
            self.gradeMateLabel5s.isHidden = true
            self.gradeMateLabel6Plus.isHidden = true
            
            break
            
        // iPhone 6+
        case (736):
            self.gradeMateLabel5s.isHidden = true
            self.gradeMateLabel6s.isHidden = true
            
            break
            
        default:
            break
        }
    }
}
