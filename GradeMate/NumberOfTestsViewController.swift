//
//  NumberOfTestsViewController.swift
//  GradeMate
//
//  Created by Vince Carpino on 10/16/16.
//  Copyright © 2016 The Half-Blood Jedi. All rights reserved.
//

import UIKit

class NumberOfTestsViewController: UIViewController, UIPickerViewDelegate
{
    
    @IBOutlet weak var firstThingsFirstLabel: UILabel!
    
    
    // Arrays for populating PickerView
    var numbers: [Int] = []
    var stringNumbers: [String] = []
    
    // Member variable for number of tests that have already been taken
    var m_numberOfTests: Int = 0
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        populateArrays()
        
        checkScreenSize()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Picker View
    
    // Number of columns in the PickerView
    func numberOfComponentsInPickerView(_ pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    
    // Number of items in each column
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return stringNumbers.count
    }
    
    
    // Label for each component
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return stringNumbers[row]
    }
    
    
    // Gets the numbers that are selected in each row and column
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        setNumberOfTests(value: numbers[row])
    }
    
    
    // MARK: - Populating Arrays
    
    func populateArrays()
    {
        for i in 0...14
        {
            numbers.append(i + 1)
            stringNumbers.append(String(i + 1))
        }
    }
    
    // MARK: - Getters & Setters

    func setNumberOfTests(value: Int)
    {
        self.m_numberOfTests = value
    }
    
    func getNumberOfTests() -> Int
    {
        return self.m_numberOfTests
    }
    
    
    
    // MARK: - Checking Screen Size
    
    func checkScreenSize()
    {
        let screenHeight = UIScreen.main.bounds.size.height
        
        // Hide GradeMate labels based on screen size
        switch (screenHeight)
        {
        // iPhone 4
        case (480):
            self.firstThingsFirstLabel.isHidden = true
            
            break
            
        // iPhone 5
        case (568):
            self.firstThingsFirstLabel.isHidden = true
            
            break
            
        default:break
            
        }
    }
}




























