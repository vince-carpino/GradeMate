//
//  ViewController.swift
//  GradeMate
//
//  Created by Vince Carpino on 6/26/16.
//  Copyright © 2016 TheHalfBloodJedi. All rights reserved.
//

import FlatUIKit
import PickerView

class FinalCalculatorViewController: PickerViewController {
    // BLUR EFFECT VIEW
//    @IBOutlet weak var visualEffectView: UIVisualEffectView!

    @IBOutlet var mainView: UIView!
    
    

    @IBOutlet weak var gradeMateContainer: UIView!
    @IBOutlet weak var infoContainer: UIView!
    @IBOutlet weak var pickerViewContainer: UIView!
    @IBOutlet weak var calculateContainer: UIView!
    

    
    // GRADEMATE BUTTON MENU ITEMS
    @IBOutlet var gradeMateButtonView: UIView!
    @IBOutlet weak var shareLinkButton: FUIButton!
    @IBOutlet weak var writeReviewButton: FUIButton!
    @IBOutlet weak var gradeMateButtonViewBackButton: FUIButton!
    
    // SCORE POP UP, WARNING LABEL & DISMISS BUTTON
//    @IBOutlet var resultView: UIView!
//    @IBOutlet weak var resultViewScoreLabel: UILabel!
//    @IBOutlet weak var resultViewWarningLabel: UILabel!
//    @IBOutlet weak var resultViewDismissButton: FUIButton!
    
    // CURRENT GRADE INFO POP UP & DISMISS BUTTON
    @IBOutlet var currentGradeInfoView: UIView!
    @IBOutlet weak var currentGradeInfoDismiss: FUIButton!
    
    // EXAM WEIGHT INFO POP UP & DISMISS BUTTON
    @IBOutlet var examWeightInfoView: UIView!
    @IBOutlet weak var examWeightInfoDismiss: FUIButton!
    
    // DESIRED GRADE INFO POP UP & DISMISS BUTTON
    @IBOutlet var desiredGradeInfoView: UIView!
    @IBOutlet weak var desiredGradeInfoDismiss: FUIButton!
    
    // INFO BUTTONS
    @IBOutlet weak var currentGradeButton: FUIButton!
    @IBOutlet weak var examWeightButton: FUIButton!
    @IBOutlet weak var desiredGradeButton: FUIButton!
    
    // GRADEMATE BUTTON
    @IBOutlet weak var gradeMateButton: FUIButton!
    @IBOutlet weak var gradeMateButtonShadow: FUIButton!
    
    // CALCULATE BUTTON
    @IBOutlet weak var calculateButton: FUIButton!
    
    // HIDDEN MENU BUTTON
    //@IBOutlet weak var menuButton: UIButton!
    
    // CUSTOM PICKERVIEWS
    //    var pickerView1: PickerView
    //    var pickerView2: PickerView
    //    var pickerView3: PickerView
    //    var pickerView4: PickerView
    
    // NUMBERS THAT WILL GO INTO THE PICKERVIEW
    var numbers: [[Double]] = [[], [], [], []]
//    var stringNumbers: [[String]] = [[], [], [], []]
    
    let calculateButtonWords: [String] = [
        "Calculate",
        "Punch it",
        "Let's go",
        "Fingers crossed",
        "Work your magic",
        "Reality check",
        "Go for it",
        "Surprise me",
        "Hit me"
    ]
    
//    var currentGrade = 0.0
//    var decimalValue = 0.0
//    var examWeight   = 0.0
//    var desiredGrade = 0
    
//    var scoreValue = 0.0
    
    // STRING VERSION OF SCORE NEEDED AND MESSAGE IN RESULT POP UP
//    var value   = ""
//    var message = ""
    
    // ADDED SENTENCE AT END OF MESSAGE AND DISMISS BUTTON TEXT
//    var warning = ""
//    var dismiss = ""
    
    var bounds = UIScreen.main.bounds
//    var effect: UIVisualEffect!                // FOR BLUR EFFECT
    
//    let letterGradientImage = UIImage(named: "GradeGradient")
    
//    var statusBarIsHidden: Bool = false {
//        didSet {
//            UIView.animate(withDuration: 0.3) { () -> Void in
//                self.setNeedsStatusBarAppearanceUpdate()
//            }
//        }
//    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.isHeroEnabled = true

        gradeMateButton.heroModifiers = [.fade, .scale(0.5)]
        gradeMateButtonShadow.heroModifiers = [.fade, .scale(0.5)]
        currentGradeButton.heroModifiers = [.fade, .translate(x: -50, y: 0, z: 0)]
//        currentGradeButton.heroModifiers = [.fade, .scale(0.5)]
        examWeightButton.heroModifiers = [.fade, .scale(0.5)]
        desiredGradeButton.heroModifiers = [.fade, .translate(x: 50, y: 0, z: 0)]
//        desiredGradeButton.heroModifiers = [.fade, .scale(0.5)]
        picker1.heroModifiers = [.fade, .translate(x: 0, y: 50, z: 0)]
        picker2.heroModifiers = [.fade, .translate(x: 0, y: 50, z: 0)]
        picker3.heroModifiers = [.fade, .translate(x: 0, y: 50, z: 0)]
        picker4.heroModifiers = [.fade, .translate(x: 0, y: 50, z: 0)]
//        picker1.heroModifiers = [.fade, .scale(0.5)]
//        picker2.heroModifiers = [.fade, .scale(0.5)]
//        picker3.heroModifiers = [.fade, .scale(0.5)]
//        picker4.heroModifiers = [.fade, .scale(0.5)]
        calculateButton.heroModifiers = [.fade, .scale(0.5)]




        
//        print("GradeMate Button/Shadow Y: \(gradeMateButton.frame.origin.y), \(gradeMateButtonShadow.frame.origin.y)")
        
        // Checks size of screen to determine GradeMate label position & size
        //        checkScreenSize()
        
//        self.gradeMateLabel5s.isHidden = true
//        self.gradeMateLabel6s.isHidden = true
//        self.gradeMateLabel6Plus.isHidden = true

        setGradeMateLabelSize()
        
        // CENTER-ALIGN TEXT ON BUTTONS
        centerButtonText()
        
        // POPULATE ARRAYS FOR PICKER VIEW
//        populateArrays()
        
        // SET STARTING VALUES FOR PICKER VIEW
//        setCurrentGrade(100.0)
//        setDecimalValue(0.0)
//        setExamWeight(1.0)
//        setDesiredGrade(100.0)
        
//        setDefaultResultInfo()
        
        // HIDE MENU BUTTON
        //menuButton.isHidden = false
        
        // Extend bounds for exam weight button label
        //setButtonLabelBounds(button: examWeightButton, value: -1)
        
//        effect = visualEffectView.effect        // STORES EFFECT IN VAR TO USE LATER IN ANIMATION
//        visualEffectView.effect = nil            // TURNS OFF BLUR WHEN VIEW LOADS
//        visualEffectView.isHidden = true        // HIDES BLUR EFFECT SO BUTTONS CAN BE USED
        
//        resultView.layer.cornerRadius = 10        // ROUNDS OFF CORNERS OF POP UP VIEW
        //		resultViewDismissButton.layer.cornerRadius = 23
        
        currentGradeInfoView.layer.cornerRadius = 10
        
        examWeightInfoView.layer.cornerRadius = 10
        
        desiredGradeInfoView.layer.cornerRadius = 10
        
        gradeMateButtonView.layer.cornerRadius = 10
        
        //calculateButton.titleLabel?.minimumScaleFactor = 0.5
        //calculateButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        makeAllButtonsExclusiveTouch()
        
        let upperButtonColors = UIColor(fromHexCode: "#18C0EE")
        let upperButtonShadows = UIColor(fromHexCode: "#149EC6")
        
        //        calculateButton.buttonColor = UIColor(fromHexCode: "#1ACB83")
        //        calculateButton.shadowColor = UIColor(fromHexCode: "#16ac70")
        
        calculateButton.buttonColor = UIColor(fromHexCode: "#1ABC9C")
        calculateButton.shadowColor = UIColor(fromHexCode: "#16A085")
        
        calculateButton.shadowHeight = 6.0
        calculateButton.cornerRadius = 6.0
        calculateButton.setTitleColor(.clouds(), for: .normal)
        calculateButton.setTitleColor(.clouds(), for: .highlighted)
        
        currentGradeButton.buttonColor = upperButtonColors
        currentGradeButton.shadowColor = upperButtonShadows
        currentGradeButton.shadowHeight = 6.0
        currentGradeButton.cornerRadius = 6.0
        currentGradeButton.setTitleColor(.clouds(), for: .normal)
        currentGradeButton.setTitleColor(.clouds(), for: .highlighted)
        
        examWeightButton.buttonColor = upperButtonColors
        examWeightButton.shadowColor = upperButtonShadows
        examWeightButton.shadowHeight = 6.0
        examWeightButton.cornerRadius = 6.0
        examWeightButton.setTitleColor(.clouds(), for: .normal)
        examWeightButton.setTitleColor(.clouds(), for: .highlighted)
        
        desiredGradeButton.buttonColor = upperButtonColors
        desiredGradeButton.shadowColor = upperButtonShadows
        desiredGradeButton.shadowHeight = 6.0
        desiredGradeButton.cornerRadius = 6.0
        desiredGradeButton.setTitleColor(.clouds(), for: .normal)
        desiredGradeButton.setTitleColor(.clouds(), for: .highlighted)
        
        currentGradeInfoDismiss.buttonColor = UIColor(fromHexCode: "#1ACB83")
        currentGradeInfoDismiss.shadowColor = UIColor(fromHexCode: "#16ac70")
        currentGradeInfoDismiss.shadowHeight = 6.0
        currentGradeInfoDismiss.cornerRadius = 23.0
        currentGradeInfoDismiss.setTitleColor(.clouds(), for: .normal)
        currentGradeInfoDismiss.setTitleColor(.clouds(), for: .highlighted)
        
        examWeightInfoDismiss.buttonColor = UIColor(fromHexCode: "#1ACB83")
        examWeightInfoDismiss.shadowColor = UIColor(fromHexCode: "#16ac70")
        examWeightInfoDismiss.shadowHeight = 6.0
        examWeightInfoDismiss.cornerRadius = 23.0
        examWeightInfoDismiss.setTitleColor(.clouds(), for: .normal)
        examWeightInfoDismiss.setTitleColor(.clouds(), for: .highlighted)
        
        desiredGradeInfoDismiss.buttonColor = UIColor(fromHexCode: "#1ACB83")
        desiredGradeInfoDismiss.shadowColor = UIColor(fromHexCode: "#16ac70")
        desiredGradeInfoDismiss.shadowHeight = 6.0
        desiredGradeInfoDismiss.cornerRadius = 23.0
        desiredGradeInfoDismiss.setTitleColor(.clouds(), for: .normal)
        desiredGradeInfoDismiss.setTitleColor(.clouds(), for: .highlighted)
        
        resultViewDismissButton.buttonColor = upperButtonColors
        resultViewDismissButton.shadowColor = upperButtonShadows
        resultViewDismissButton.shadowHeight = 6.0
        resultViewDismissButton.cornerRadius = 23.0
        resultViewDismissButton.setTitleColor(.clouds(), for: .normal)
        resultViewDismissButton.setTitleColor(.clouds(), for: .highlighted)
        
        gradeMateButton.buttonColor = .clear
        gradeMateButton.shadowColor = .clear
        gradeMateButton.shadowHeight = 5.0
        gradeMateButton.cornerRadius = 6.0
        gradeMateButton.setTitleColor(.clouds(), for: .normal)
        
        gradeMateButtonShadow.buttonColor = .clear
        gradeMateButtonShadow.shadowColor = .clear
        gradeMateButtonShadow.shadowHeight = 5.0
        gradeMateButtonShadow.cornerRadius = 6.0
        gradeMateButtonShadow.setTitleColor(.asbestos(), for: .normal)
        
        gradeMateButtonViewBackButton.buttonColor = calculateButton.buttonColor
        gradeMateButtonViewBackButton.shadowColor = calculateButton.shadowColor
        gradeMateButtonViewBackButton.shadowHeight = calculateButton.shadowHeight
        gradeMateButtonViewBackButton.cornerRadius = calculateButton.cornerRadius
        gradeMateButtonViewBackButton.setTitleColor(.white, for: .normal)
        
        shareLinkButton.buttonColor = upperButtonColors
        shareLinkButton.shadowColor = upperButtonShadows
        shareLinkButton.shadowHeight = calculateButton.shadowHeight
        shareLinkButton.cornerRadius = currentGradeInfoDismiss.cornerRadius
        shareLinkButton.setTitleColor(.white, for: .normal)
        
        writeReviewButton.buttonColor = upperButtonColors
        writeReviewButton.shadowColor = upperButtonShadows
        writeReviewButton.shadowHeight = calculateButton.shadowHeight
        writeReviewButton.cornerRadius = currentGradeInfoDismiss.cornerRadius
        writeReviewButton.setTitleColor(.white, for: .normal)
        
        
        currentGradeButton.titleLabel?.numberOfLines = 2
        desiredGradeButton.titleLabel?.numberOfLines = 2
        examWeightButton.titleLabel?.numberOfLines = 2
        
        calculateButton.titleLabel?.numberOfLines = 1
        calculateButton.titleLabel?.adjustsFontSizeToFitWidth = true

        resultViewDismissButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        
//        print("GradeMate Button/Shadow Y: \(gradeMateButton.frame.origin.y), \(gradeMateButtonShadow.frame.origin.y)")
        
//        print("grademate button/shadow CENTER y: \(gradeMateButton.center.y), \(gradeMateButtonShadow.center.y)")

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
//        return .slide
//    }
//    
//    override var prefersStatusBarHidden: Bool {
//        return statusBarIsHidden
//    }
    
    
    
//    // MARK: - PICKER VIEW
//
//    // SET NUMBER OF COLUMNS
//    @objc func numberOfComponentsInPickerView(_ pickerView: UIPickerView) -> Int {
//        return stringNumbers.count
//    }
//
//
//    // SET NUMBER OF ITEMS IN EACH COLUMN
//    @objc func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return stringNumbers[component].count
//    }
//
//
//    // SET FONT STYLE AND SIZE
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        var pickerLabel = view as! UILabel!
//
//        if view == nil { pickerLabel = UILabel() }
//
//        //        let currentRow = row
//
//        pickerLabel?.backgroundColor = .clear
//
//        //        if pickerView.selectedRow(inComponent: component) != currentRow {
//        //            pickerLabel?.backgroundColor = .clear
//        //        } else {
//        pickerLabel?.layer.masksToBounds = true
//        pickerLabel?.layer.cornerRadius = 16
//        pickerLabel?.backgroundColor = checkColor(component: component, row: row)
//        //        }
//
//        let titleData = stringNumbers[component][row]
//        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedStringKey.font: UIFont(name: "Courier", size: 24)!])
//        pickerLabel!.attributedText = myTitle
//        pickerLabel?.textAlignment = .center
//        pickerLabel?.textColor = .white
//
//        return pickerLabel!
//    }
    
//    func checkColor(component: Int, row: Int) -> UIColor {
//        var color = UIColor()
//        var coords : CGPoint
//
//        if component == 0 || component == 3 {
//            coords = CGPoint(x: 0, y: row)
//            color = (letterGradientImage?.getPixelColor(pos: coords))!
//        } else {
//            color = .clear
//        }
//
//        return color
//    }
    
    
//    // GET NUMBERS THAT ARE SELECTED IN EACH ROW AND COLUMN
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        // SET VALUES FOR CALCULATION
//        setCurrentGrade(numbers[0][pickerView.selectedRow(inComponent: 0)])
//        setDecimalValue(numbers[1][pickerView.selectedRow(inComponent: 1)])
//        setExamWeight  (numbers[2][pickerView.selectedRow(inComponent: 2)])
//        setDesiredGrade(numbers[3][pickerView.selectedRow(inComponent: 3)])
//
//        calculate( getCurrentGrade(), decimalValue: getDecimalValue(), examWeightDbl: getExamWeight(), desiredGradeDbl: getDesiredGrade() )
//
//        setGradeValue( String(format: "%.0f", getScoreValue()) + "%" )
//
//        checkScoreValue(getScoreValue())
//
//        if component == 0 || component == 3 {
//            pickerView.reloadComponent(component)
//        }
//
//        // SET POP UP VIEW LABELS
//        self.resultViewScoreLabel.text = getValue()
//        self.resultViewWarningLabel.text = getWarning()
//        self.resultViewDismissButton.setTitle(getDismiss(), for: .normal)
//    }
    
    
//    // Size each column
//    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
//        let screenHeight = UIScreen.main.bounds.size.height
//        
//        // Change dial sizes based on screen size
//        switch screenHeight
//        {
//        // 3.5"
//        case 480:
//            switch component {
//            // Column 1
//            case 0:
//                return bounds.width / 6.53
//                
//            // Column 2
//            case 1:
//                return bounds.width / (6 + 2/3)
//                
//            // Column 3
//            case 2:
//                return bounds.width / 2.95
//                
//            // Column 4
//            case 3:
//                return bounds.width / 3.35
//                
//            default:break
//            }
//            
//            break
//            
//        // 4.0"
//        case 568:
//            switch component {
//            // Column 1
//            case 0:
//                return bounds.width / 6.53
//                
//            // Column 2
//            case 1:
//                return bounds.width / (6 + 2/3)
//                
//            // Column 3
//            case 2:
//                return bounds.width / 2.95
//                
//            // Column 4
//            case 3:
//                return bounds.width / 3.35
//                
//            default:break
//            }
//            
//            break
//            
//        // 4.7"
//        case 667:
//            switch component {
//            // Column 1
//            case 0:
//                return bounds.width / 5
//                
//            // Column 2
//            case 1:
//                return bounds.width / 7.812
//                
//            // Column 3
//            case 2:
//                return bounds.width / 3.25
//                
//            // Column 4
//            case 3:
//                return bounds.width / 3
//                
//            default:break
//            }
//            
//            break
//            
//        // 5.5"
//        case 736:
//            switch component {
//            // Column 1
//            case 0:
//                return bounds.width / 6
//                
//            // Column 2
//            case 1:
//                return bounds.width / (6.75 + 2/3)
//                
//            // Column 3
//            case 2:
//                return bounds.width / 3.25
//                
//            // Column 4
//            case 3:
//                return bounds.width / 3
//                
//            default:break
//            }
//            
//            break
//            
//        default:break
//            
//        }
//        
//        return 0
//    }
    
    
    // MARK: - GRADEMATE BUTTON
    
    // Tapped normally
    // PUT BUTTON ACTIONS IN HERE
    @IBAction func gradeMateButtonTapped(_ sender: FUIButton) {
        gradeMateButtonShadow.isHidden = false
        animateIn(viewToAnimate: self.gradeMateButtonView, height: 486)
    }
    
    // Pushed down
    @IBAction func gradeMateButtonDown(_ sender: FUIButton) {
        gradeMateButtonShadow.isHidden = true
    }
    
    // Pushed down, dragged out
    @IBAction func gradeMateButtonTouchDragExit(_ sender: FUIButton) {
        gradeMateButtonShadow.isHidden = false
    }
    
    // Pushed down, dragged out, dragged back in
    @IBAction func gradeMateButtonTouchDragEnter(_ sender: FUIButton) {
        gradeMateButtonShadow.isHidden = true
    }
    
    
    // MARK: GRADEMATE VIEW BUTTONS
    
    // Back
    @IBAction func gradeMateButtonViewBackButtonPressed(_ sender: FUIButton) {
        animateOut(viewToAnimate: self.gradeMateButtonView)
    }
    
    // WRITE REVIEW BUTTON
    @IBAction func gradeMateButonViewWriteReviewPressed(_ sender: FUIButton) {
        let appID = "1142404187"
        let urlStr = "itms-apps://itunes.apple.com/app/viewContentsUserReviews?id=\(appID)"
        let url = URL(string: urlStr)!
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    // SHARE BUTTON
    @IBAction func gradeMateButtonViewShareButton(_ sender: FUIButton) {
        let url = URL(string: "https://appsto.re/us/Br7feb.i")!
        
        showShareSheet(itemsToShare: [url])
    }
    
    
    // MARK: - INFO BUTTONS
    
    // Current Grade Tapped
    @IBAction func currentGradeTapped(_ sender: FUIButton) {
        animateIn(viewToAnimate: self.currentGradeInfoView, height: 230)
    }
    
    // Weight Button Tapped
    @IBAction func weightButtonTapped(_ sender: FUIButton) {
        animateIn(viewToAnimate: self.examWeightInfoView, height: 230)
    }
    
    // Desired Grade Tapped
    @IBAction func desiredGradeTapped(_ sender: FUIButton) {
        animateIn(viewToAnimate: self.desiredGradeInfoView, height: 230)
    }
    
    
    // MARK: - POP UP ANIMATION
    
//    // Animate In
//    func animateIn(viewToAnimate: UIView) {
//        self.visualEffectView.isHidden = false
//        
//        self.view.addSubview(viewToAnimate)                                        // ADD POP UP VIEW TO MAIN VIEW
//        viewToAnimate.center = self.view.center                                    // CENTER POP UP VIEW IN MAIN VIEW
//        
//        viewToAnimate.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)    // MAKE POP UP VIEW SLIGHTLY BIGGER BEFORE IT IS DISPLAYED
//        viewToAnimate.alpha = 0
//        
//        // Animate pop up, returning it to its normal state (identity)
//        UIView.animate(withDuration: 0.4, animations: {
//            self.visualEffectView.effect = self.effect
//            viewToAnimate.alpha = 1
//            viewToAnimate.transform = CGAffineTransform.identity
//        })
//        
////        statusBarIsHidden = true
//    }
//    
//    // Animate Out
//    func animateOut(viewToAnimate: UIView) {
//        UIView.animate(withDuration: 0.3, animations: {
//            viewToAnimate.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
//            viewToAnimate.alpha = 0
//            
//            self.visualEffectView.effect = nil
//            
//        }) { (success:Bool) in
//            viewToAnimate.removeFromSuperview()
//            self.visualEffectView.isHidden = true
//        }
//        
////        statusBarIsHidden  = false
//    }
    
    
    // MARK: - DISMISS POP UPS
    
    // Result View
//    @IBAction func dismissPopUp(_ sender: FUIButton) {
//        animateOut(viewToAnimate: self.resultView)
//    }
    
    // Current Grade Info View
    @IBAction func currentGradeInfoDismiss(_ sender: FUIButton) {
        animateOut(viewToAnimate: self.currentGradeInfoView)
    }
    
    // Exam Weight Info View
    @IBAction func examWeightInfoDismiss(_ sender: FUIButton) {
        animateOut(viewToAnimate: self.examWeightInfoView)
    }
    
    // Desired Grade Info View
    @IBAction func desiredGradeInfoDismiss(_ sender: FUIButton) {
        animateOut(viewToAnimate: self.desiredGradeInfoView)
    }
    
    
    // MARK: - SHOW SHARE SHEET
    func showShareSheet(itemsToShare: [Any]) {
        let activityVC = UIActivityViewController(activityItems: itemsToShare, applicationActivities: nil)
        
        let excludedActivities = [UIActivityType.postToFlickr, UIActivityType.postToWeibo, UIActivityType.print, UIActivityType.assignToContact, UIActivityType.saveToCameraRoll, UIActivityType.addToReadingList, UIActivityType.postToFlickr, UIActivityType.postToVimeo, UIActivityType.postToTencentWeibo]
        
        activityVC.excludedActivityTypes = excludedActivities
        
        activityVC.popoverPresentationController?.sourceView = self.view
        
        self.present(activityVC, animated: true, completion: nil)
    }
    
    
    
    
    // MARK: - CALCULATE BUTTON TAPPED
    
    @IBAction func calculateTapped(_ sender: FUIButton) {
        
        animateIn(viewToAnimate: self.resultView, height: 270)

//        // CHANGE BUTTON TEXT
//        let arraySize = calculateButtonWords.count
//        let randNum   = arc4random_uniform(UInt32(arraySize))
//        let randInt    = Int(randNum)
//        calculateButton.setTitle(calculateButtonWords[randInt], for: .normal)
    }
    
    
    
    // MARK: - GETTERS
    
//    fileprivate func getCurrentGrade() -> Double {
//        return self.currentGrade
//    }
//
//    fileprivate func getDecimalValue() -> Double {
//        return self.decimalValue
//    }
//
//    fileprivate func getExamWeight() -> Double {
//        return self.examWeight
//    }
//
//    fileprivate func getDesiredGrade() -> Int {
//        return self.desiredGrade
//    }
//
//    fileprivate func getScoreValue() -> Double {
//        return self.scoreValue
//    }
//
//    fileprivate func getWarning() -> String {
//        return self.warning
//    }
//
//    fileprivate func getDismiss() -> String {
//        return self.dismiss
//    }
//
//    fileprivate func getValue() -> String {
//        return self.value
//    }
    
    
    
    // MARK: - SETTERS
    
//    fileprivate func setCurrentGrade(_ value: Double) {
//        self.currentGrade = value
//    }
//
//    fileprivate func setDecimalValue(_ value: Double) {
//        self.decimalValue = value
//    }
//
//    fileprivate func setExamWeight(_ value: Double) {
//        self.examWeight = value
//    }
//
//    fileprivate func setDesiredGrade(_ value: Double) {
//        self.desiredGrade = Int(value)
//    }
//
//    fileprivate func setScoreValue(_ value: Double) {
//        self.scoreValue = value;
//    }
//
//    fileprivate func setWarning(_ warning: String) {
//        self.warning = warning
//    }
//
//    fileprivate func setDismiss(_ message: String) {
//        self.dismiss = message
//    }
//
//    fileprivate func setGradeValue(_ value: String) {
//        self.value = value
//    }
    
    
    
    // MARK: - CALCULATE GRADE
    
//    func calculate(_ currentGradeDbl: Double, decimalValue: Double, examWeightDbl: Double, desiredGradeDbl: Int) {
//        let currentGrade = (currentGradeDbl + decimalValue) / 100.0
//        
//        let examWeight = examWeightDbl / 100.0
//        
//        let desiredGrade = Double(desiredGradeDbl) / 100.0
//        
//        setScoreValue(floor((( desiredGrade - (1 - examWeight) * currentGrade) / examWeight) * 100))
//    }
    
    
//    // MARK: - POPULATE ARRAYS
//
//    func populateArrays() {
//        for i in 0...3 {
//            switch (i) {
//            // First column
//            case 0:
//                for j in (1...100).reversed() {
//                    numbers[i].append(Double(j))
////                    stringNumbers[i].append(String(j))
//                }
//
//            // Second column
//            case 1:
//                for j in 0...9 {
//                    numbers[i].append(Double(j) / 10.0)
//
////                    var stringDecimal = (String(Double(j) / 10.0) + "%")
////
////                    // Remove the leading zero on decimal
////                    stringDecimal.remove(at: stringDecimal.startIndex)
////
////                    stringNumbers[i].append(stringDecimal)
//                }
//
//            // Third column
//            case 2:
//                for j in (1...100) {
//                    numbers[i].append(Double(j))
////                    stringNumbers[i].append(String(j) + "%")
//                }
//
//            // Fourth column
//            case 3:
//                for j in (1...100).reversed() {
//                    numbers[i].append(Double(j))
////                    stringNumbers[i].append(String(j) + "%")
//                }
//
//            default:break
//            }
//        }
//    }
    
    
//    // MARK: - CHECK SCREEN SIZE
//
//    func checkScreenSize() {
//        let screenHeight = UIScreen.main.bounds.size.height
//
//        // Hide GradeMate labels & resize pop ups based on screen size
//        switch (screenHeight) {
//
//        // 3.5"
//        case (480):
//            // Hide GradeMate labels
//            self.gradeMateLabel5s.isHidden = true
//            self.gradeMateLabel6s.isHidden = true
//            self.gradeMateLabel6Plus.isHidden = true
//
//            // Resize pop ups to fit screen
//            self.currentGradeInfoView.frame = CGRect(x: 0, y: 0, width: 300, height: 215)
//            self.examWeightInfoView.frame = CGRect(x: 0, y: 0, width: 300, height: 215)
//            self.desiredGradeInfoView.frame = CGRect(x: 0, y: 0, width: 300, height: 215)
//            self.resultView.frame = CGRect(x: 0, y: 0, width: 300, height: 250)
//
//            // Resize text on Current Grade Dismiss button
//            self.currentGradeInfoDismiss.titleLabel?.numberOfLines = 1
//            self.currentGradeInfoDismiss.titleLabel?.adjustsFontSizeToFitWidth = true
//
//            // Resize text on Exam Weight Dismiss button
//            self.examWeightInfoDismiss.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10)
//            self.examWeightInfoDismiss.titleLabel?.adjustsFontSizeToFitWidth = true
//
//            // Resize text on Result Dismiss button
//            self.resultViewDismissButton.titleLabel?.minimumScaleFactor = 0.5
//            self.resultViewDismissButton.titleLabel?.adjustsFontSizeToFitWidth = true
//            self.resultViewDismissButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10)
//
//            break
//
//        // 4.0"
//        case (568):
//            // Hide GradeMate labels
//            self.gradeMateLabel6s.isHidden = true
//            self.gradeMateLabel6Plus.isHidden = true
//
//            // Resize pop ups to fit screen
//            self.currentGradeInfoView.frame = CGRect(x: 0, y: 0, width: 300, height: 215)
//            self.examWeightInfoView.frame = CGRect(x: 0, y: 0, width: 300, height: 215)
//            self.desiredGradeInfoView.frame = CGRect(x: 0, y: 0, width: 300, height: 215)
//
//            self.currentGradeInfoDismiss.titleLabel?.adjustsFontSizeToFitWidth = true
//
//            self.examWeightInfoDismiss.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10)
//            self.examWeightInfoDismiss.titleLabel?.adjustsFontSizeToFitWidth = true
//
//            self.resultViewDismissButton.titleLabel?.minimumScaleFactor = 0.5
//            self.resultViewDismissButton.titleLabel?.adjustsFontSizeToFitWidth = true
//            self.resultViewDismissButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10)
//
//            self.resultView.frame = CGRect(x: 0, y: 0, width: 300, height: 250)
//
//            break
//
//        // 4.7"
//        case (667):
//            self.gradeMateLabel5s.isHidden = true
//            self.gradeMateLabel6Plus.isHidden = true
//
//            self.resultViewDismissButton.titleLabel?.minimumScaleFactor = 0.5
//            self.resultViewDismissButton.titleLabel?.adjustsFontSizeToFitWidth = true
//            self.resultViewDismissButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10)
//
//            break
//
//        // 5.5"
//        case (736):
//            self.gradeMateLabel5s.isHidden = true
//            self.gradeMateLabel6s.isHidden = true
//
//            self.resultViewDismissButton.titleLabel?.minimumScaleFactor = 0.5
//            self.resultViewDismissButton.titleLabel?.adjustsFontSizeToFitWidth = true
//            self.resultViewDismissButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10)
//
//            break
//
//        default:break
//        }
//    }
    
    // MARK: - SET GRADEMATE LABEL SIZE
    func setGradeMateLabelSize() {
        let screenHeight = UIScreen.main.bounds.size.height
        
        switch screenHeight {
        case 480:
            // 4s code
//            self.gradeMateLabel5s.isHidden = true
//            self.gradeMateLabel6s.isHidden = true
//            self.gradeMateLabel6Plus.isHidden = true
            gradeMateButton.isHidden = true
            gradeMateButtonShadow.isHidden = true
            break
        case 568:
            // 5s code
            
            //            gradeMateButton.translatesAutoresizingMaskIntoConstraints = true
            //            gradeMateButton.frame.origin.y = 38
            //			gradeMateButton.titleLabel?.font = gradeMateButton.titleLabel?.font.withSize(53)
            gradeMateButton.titleLabel?.adjustsFontSizeToFitWidth = true
            gradeMateButtonShadow.titleLabel?.adjustsFontSizeToFitWidth = true
            //            gradeMateButton.center.x = view.center.x
            
            break
        case 667:
            // 6s code
            
            //            gradeMateButton.translatesAutoresizingMaskIntoConstraints = true
            //            gradeMateButton.frame.origin.y = 57
            //            gradeMateButton.titleLabel?.font = gradeMateButton.titleLabel?.font.withSize(63)
            gradeMateButton.titleLabel?.adjustsFontSizeToFitWidth = true
            gradeMateButtonShadow.titleLabel?.adjustsFontSizeToFitWidth = true
            //            gradeMateButton.center.x = view.center.x
            
            break
        case 736:
            // plus code
            
            //gradeMateButton.translatesAutoresizingMaskIntoConstraints = true
            //gradeMateButton.frame.origin.y = 66
//            gradeMateButton.titleLabel?.font = gradeMateButton.titleLabel?.font.withSize(69)
            //gradeMateButton.center.x = view.center.x
            
            gradeMateButton.titleLabel?.adjustsFontSizeToFitWidth = true
            gradeMateButtonShadow.titleLabel?.adjustsFontSizeToFitWidth = true
            
            break
        default:break
        }
    }
    
    // MARK: - SET BUTTON STYLE
    func setButtonStyle(button: FUIButton, buttonColor: UIColor, shadowColor: UIColor, cornerRadius: CGFloat) {
        button.shadowHeight = 6.0
        button.buttonColor = buttonColor
        button.shadowColor = shadowColor
        button.cornerRadius = cornerRadius
        
        button.setTitleColor(.clouds(), for: .normal)
        button.setTitleColor(.clouds(), for: .highlighted)
    }
    
    
    // MARK: - SET ROUNDED CORNERS OF BUTTON
    
    func setCornersForButton(button: UIButton, value: Double) -> Void {
        button.layer.cornerRadius = CGFloat(value)
    }
    
    
    // MARK: - SET ROUNDED CORNERS OF LABEL
    
    func setCornersForLabel(label: UILabel, value: Double) -> Void {
        label.layer.masksToBounds = true
        label.layer.cornerRadius = CGFloat(value)
    }
    
    
    // MARK: - EXPAND BUTTON LABEL BOUNDS
    
    func setButtonLabelBounds(button: UIButton, value: Double) -> Void {
        button.contentEdgeInsets.top = CGFloat(value)
        button.contentEdgeInsets.bottom = CGFloat(value)
        button.contentEdgeInsets.left = CGFloat(value)
        button.contentEdgeInsets.right = CGFloat(value)
    }
    
    // MARK: - CENTER INFO BUTTONS TEXT
    func centerButtonText() {
        currentGradeButton.titleLabel?.textAlignment = .center
        examWeightButton.titleLabel?.textAlignment = .center
        desiredGradeButton.titleLabel?.textAlignment = .center
    }
    
    // MARK: - SET DEFAULT RESULT POP UP INFO
    func setDefaultResultInfo() {
        self.resultViewScoreLabel.text = "100%"
        self.resultViewWarningLabel.text = "May the Force be with you..."
        self.resultViewDismissButton.setTitle("Thank you, Master 🙏", for: .normal)
    }
    
    // MARK: - MAKE ALL BUTTONS EXCLUSIVE TOUCH
    func makeAllButtonsExclusiveTouch() {
        currentGradeButton.isExclusiveTouch      = true
        examWeightButton.isExclusiveTouch        = true
        desiredGradeButton.isExclusiveTouch      = true
        calculateButton.isExclusiveTouch         = true
        resultViewDismissButton.isExclusiveTouch = true
        currentGradeInfoDismiss.isExclusiveTouch = true
        examWeightInfoDismiss.isExclusiveTouch   = true
        desiredGradeInfoDismiss.isExclusiveTouch = true
        gradeMateButton.isExclusiveTouch         = true
        shareLinkButton.isExclusiveTouch   = true
        writeReviewButton.isExclusiveTouch = true
        gradeMateButtonViewBackButton.isExclusiveTouch   = true
    }
    
    // MARK: - SHOW ALERT
    
    func showAlert() {
        let alert = UIAlertController(title: "⚠️ Wait! ⚠️", message: "Are you sure about these values? 😬", preferredStyle: UIAlertControllerStyle.alert)
        
        let yes = UIAlertAction(title: "Yes", style: UIAlertActionStyle.destructive, handler: nil)
        
        let no = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        alert.addAction(yes)
        alert.addAction(no)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //    // MARK: Show Results
    //    
    //    func showResults(_ result: String, message: String, warning: String)
    //    {
    //        let alert = UIAlertController(title: getValue(), message: getMessage() + getWarning(), preferredStyle: .alert)
    //        
    //        let okay = UIAlertAction(title: getDismiss(), style: .cancel, handler: nil)
    //        
    //        alert.addAction(okay)
    //        
    //        self.present(alert, animated: true, completion: nil)
    //    }
    
    
    
    // MARK: - RESPONSES
    
//    func checkScoreValue(_ value: Double) {
//        switch Int(value) {
//        // 301+
//        case let x where x > 300:
//            setWarning("I think it's safe to say that this is not your best subject.")
//            setDismiss("No 💩, Sherlock")
//            break
//
//        // 201 - 300
//        case let x where x > 200:
//            setWarning("Bribery is your only hope at this point...")
//            setDismiss("I would never...😈")
//            break
//
//        // 151 - 200
//        case let x where x > 150:
//            setWarning("It's okay to cry...")
//            setDismiss("Already am 😭")
//            break
//
//        // 126 - 150
//        case let x where x > 125:
//            setWarning("It's not lookin' good for you...")
//            setDismiss("I surrender 🏳")
//            break
//
//        // 116 - 125
//        case let x where x > 115:
//            setWarning("You shall not pass! ✋")
//            setDismiss("Thanks, Gandalf 😐")
//            break
//
//        // 101 - 115
//        case let x where x > 100:
//            setWarning("Is there extra credit? 😬")
//            setDismiss("I'll look into that 🙄")
//            break
//
//        // 100
//        case let x where x == 100:
//            setWarning("May the Force be with you...")
//            setDismiss("Thank you, Master 🙏")
//            break
//
//        // 90 - 99
//        case let x where x >= 90:
//            setWarning("I have faith in you.")
//            setDismiss("Thanks bro 😅")
//            break
//
//        // 80 - 89
//        case let x where x >= 80:
//            setWarning("You got this.")
//            setDismiss("It's possible 🤔")
//            break
//
//        // 70 - 79
//        case let x where x >= 70:
//            setWarning("Not so bad.")
//            setDismiss("Alright 😛")
//            break
//
//        // 60 - 69
//        case let x where x >= 60:
//            setWarning("Piece o' cake.")
//            setDismiss("Yes please 🍰")
//            break
//
//        // 50 - 59
//        case let x where x >= 50:
//            setWarning("No problemo.")
//            setDismiss("I can do that 😃")
//            break
//
//        // 1 - 49
//        case let x where x > 0:
//            setWarning("You could bomb it.")
//            setDismiss("Chill 👌")
//            break
//
//        // <= 0
//        case let x where x <= 0:
//            setWarning("Don't even take the test, dude.")
//            setDismiss("Sweeeet 😎")
//            break
//
//        default:break
//        }
//    }
}
