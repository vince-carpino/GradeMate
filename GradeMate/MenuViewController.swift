//
//  MenuViewController.swift
//  GradeMate
//
//  Created by Vince Carpino on 10/13/16.
//  Copyright © 2016 The Half-Blood Jedi. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController
{
    @IBOutlet weak var gradeMateLabel5s: UILabel!
    @IBOutlet weak var gradeMateLabel6s: UILabel!
    @IBOutlet weak var gradeMateLabel6Plus: UILabel!

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        checkScreenSize()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
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
