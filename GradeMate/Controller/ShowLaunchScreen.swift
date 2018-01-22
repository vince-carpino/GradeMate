//
//  ShowLaunchScreen.swift
//  GradeMate
//
//  Created by Vince Carpino on 9/8/16.
//  Copyright © 2016 The Half-Blood Jedi. All rights reserved.
//

import UIKit
import BEMCheckBox
import FlatUIKit
import Hero

class ShowLaunchScreen: UIViewController {
    
    @IBOutlet weak var checkBox: BEMCheckBox!

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpCheckBox()

        // TURN CHECK BOX ON
        DispatchQueue.main.asyncAfter(deadline: (.now() + 0.25)) {
            self.checkBox.setOn(true, animated: true)
        }

        // TURN CHECK BOX OFF
        DispatchQueue.main.asyncAfter(deadline: (.now() + 1)) {
            self.checkBox.setOn(false, animated: true)
        }

        self.perform(#selector(ShowLaunchScreen.showMainView), with: nil, afterDelay: 1.5)
    }

    func setUpCheckBox() {
        checkBox.hideBox = true
        checkBox.lineWidth = 15
        checkBox.onCheckColor = .clouds()
        checkBox.onAnimationType  = .stroke
        checkBox.offAnimationType = .fade
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    @objc func showMainView() {
        performSegue(withIdentifier: "showLaunchScreen", sender: self)
    }
}
