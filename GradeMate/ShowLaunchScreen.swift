//
//  ShowLaunchScreen.swift
//  GradeMate
//
//  Created by Vince Carpino on 9/8/16.
//  Copyright © 2016 The Half-Blood Jedi. All rights reserved.
//

import UIKit

class ShowLaunchScreen: UIViewController
{
	@IBOutlet weak var grademateLabel4s: UILabel!
	@IBOutlet weak var grademateLabel5s: UILabel!
	@IBOutlet weak var grademateLabel6s: UILabel!
	@IBOutlet weak var grademateLabelPlus: UILabel!
	@IBOutlet weak var gradeMateButton: UIButton!
	
	let screenHeight = UIScreen.main.bounds.size.height
	
    override func viewDidLoad()
    {
        super.viewDidLoad()
		
		gradeMateButton.titleLabel?.adjustsFontSizeToFitWidth = true
		
		// Change dial sizes based on screen size
		switch (screenHeight)
		{
		// iPhone 4
		case (480):
			
			grademateLabel5s.isHidden = true
			grademateLabel6s.isHidden = true
			grademateLabelPlus.isHidden = true
			
			// Allows for delay when showing Launch Screen
			perform(#selector(ShowLaunchScreen.showMainView), with: nil, afterDelay: 1.85)
			
			break
			
		// iPhone 5
		case (568):
			
			grademateLabel4s.isHidden = true
			grademateLabel6s.isHidden = true
			grademateLabelPlus.isHidden = true
			
			// Animates GradeMate label with spring effect on launch
			UIView.animate(withDuration: 1.0, delay: 0.85, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
				self.grademateLabel5s.center.y -= 221.25
			}, completion: nil)
			
			// Allows for delay when showing Launch Screen
			perform(#selector(ShowLaunchScreen.showMainView), with: nil, afterDelay: 1.85)
			
			break
			
		// iPhone 6
		case (667):
			
			grademateLabel4s.isHidden = true
			grademateLabel5s.isHidden = true
			grademateLabelPlus.isHidden = true
			
			gradeMateButton.titleLabel?.font = gradeMateButton.titleLabel?.font.withSize(63)
			gradeMateButton.titleLabel?.adjustsFontSizeToFitWidth = true
			
			// Animates GradeMate label with spring effect on launch
			UIView.animate(withDuration: 1.0, delay: 0.85, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
				self.gradeMateButton.center.y -= 239
			}, completion: nil)
			
			// Allows for delay when showing Launch Screen
			perform(#selector(ShowLaunchScreen.showMainView), with: nil, afterDelay: 1.85)
			
			break
			
		// iPhone 6+
		case (736):
			
			grademateLabel4s.isHidden = true
			self.grademateLabel5s.isHidden = true
			self.grademateLabel6s.isHidden = true
			
			// Animates GradeMate label with spring effect on launch
			UIView.animate(withDuration: 1.0, delay: 0.85, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
				self.gradeMateButton.center.y -= 261.67
			}, completion: nil)
			
			// Allows for delay when showing Launch Screen
			perform(#selector(ShowLaunchScreen.showMainView), with: nil, afterDelay: 1.85)
			
			break
			
		default:break
			
		}

		
//		// Animates GradeMate label with spring effect on launch
//		UIView.animate(withDuration: 1.0, delay: 0.85, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
//			self.grademateLabel.center.y -= 246
//		}, completion: nil)
//
		
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
	
	override func viewWillAppear(_ animated: Bool)
	{
		super.viewWillAppear(animated)
	}
	
	
    func showMainView()
    {
        performSegue(withIdentifier: "showLaunchScreen", sender: self)
    }
}
