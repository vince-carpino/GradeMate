//
//  ViewController.swift
//  GradeMate
//
//  Created by Vince Carpino on 6/26/16.
//  Copyright © 2016 TheHalfBloodJedi. All rights reserved.
//

import FlatUIKit
import Hero
import PickerView

class FinalCalculatorViewController: PickerViewController, UIScrollViewDelegate {

    // GRADEMATE BUTTON MENU ITEMS
    @IBOutlet var gradeMateButtonView: UIView!
    @IBOutlet weak var shareLinkButton: FUIButton!
    @IBOutlet weak var writeReviewButton: FUIButton!
    @IBOutlet weak var gradeMateButtonViewBackButton: FUIButton!
    
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

    @IBOutlet var classesView: UIView!
    @IBOutlet weak var classesScrollView: UIScrollView!
    @IBOutlet weak var classesBackButton: FUIButton!
    
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

    var savedClassesValues: [Int] = []

    let upperButtonColors  = UIColor(fromHexCode: "#18C0EE")!
    let upperButtonShadows = UIColor(fromHexCode: "#149EC6")!

    let calculateButtonColor  = UIColor(fromHexCode: "#1ABC9C")!
    let calculateButtonShadow = UIColor(fromHexCode: "#16A085")!

    // MARK: - VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()

        self.isHeroEnabled = true

        let pages: [ClassButtonPage] = createClassButtonPages()
        setupClassesScrollView(pages: pages)

        checkForSmallScreen()

        delayStatusBar()

        addAnimations()

        roundOffPopUpCorners()

        setAllButtonStyles()

        setAllButtonTextBehavior()

        addLongPressToExamWeightButton()
//        let userDefaults = UserDefaults.standard

//        if userDefaults.object(forKey: "class1") == nil {
//            userDefaults.set(15, forKey: "class1")
//        }

//        if let val = userDefaults.object(forKey: "class1") as? Int {
//            class1Button.titleLabel?.text = String(val)
//        } else {
//            userDefaults.set(15, forKey: "class1")
//        }
    }

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

    // MARK: SAVED CLASSES VIEW

    @IBAction func classButtonPressed(_ sender: FUIButton) {

        picker3.selectRow(Int((sender.titleLabel?.text)!)! - 1, animated: true)



//        if let stored = UserDefaults.standard.object(forKey: "class1") as? Int {
//            UserDefaults.standard.set(stored + 1, forKey: "class1")
//            class1Button.titleLabel?.text = String(stored + 1)
//            picker3.selectRow(stored, animated: true)
//        }


//        if let val = UserDefaults.standard.object(forKey: "class1") as? String {
//            class1Button.titleLabel?.text = val
//        }
//
//        let text = sender.titleLabel!.text!
//        let start = text.index(text.startIndex, offsetBy: 9)
//        let end   = text.index(text.endIndex, offsetBy: -1)
//        let substring = text[start..<end]
//
//        picker3.selectRow(Int(substring)! - 1, animated: true)


        animateOut(viewToAnimate: self.classesView)
    }

    // MARK: - DISMISS POP UP
//    @IBAction func dismissPopUp(_ sender: FUIButton) {
//        animateOut(viewToAnimate: self.view.subviews.last!)
//    }


    @IBAction func savedClassesBackPressed(_ sender: FUIButton) {
//        animateOut(viewToAnimate: self.classesView)
        animateOut(viewToAnimate: self.view.subviews.last!)
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
    
    
    // MARK: - DISMISS POP UPS
    
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
        
        let excludedActivities = [.postToFlickr, .postToWeibo, .print, .assignToContact, UIActivityType.saveToCameraRoll, .addToReadingList, .postToFlickr, .postToVimeo, .postToTencentWeibo]
        
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

    func checkForSmallScreen() {
        if (UIScreen.main.bounds.size.height == 480) {
            gradeMateButton.isHidden = true
            gradeMateButtonShadow.isHidden = true
        }
    }

    func delayStatusBar() {
        DispatchQueue.main.asyncAfter(deadline: (.now() + 0.35)) {
            self.statusBarIsHidden = false
        }
    }

    func addAnimations() {
        gradeMateButton.heroModifiers = [.fade, .scale(0.5)]
        gradeMateButtonShadow.heroModifiers = [.fade, .scale(0.5)]
        currentGradeButton.heroModifiers = [.fade, .translate(x: -50, y: 0, z: 0)]
        examWeightButton.heroModifiers = [.fade, .scale(0.5)]
        desiredGradeButton.heroModifiers = [.fade, .translate(x: 50, y: 0, z: 0)]
        picker1.heroModifiers = [.fade, .translate(x: 0, y: 50, z: 0)]
        picker2.heroModifiers = [.fade, .translate(x: 0, y: 50, z: 0)]
        picker3.heroModifiers = [.fade, .translate(x: 0, y: 50, z: 0)]
        picker4.heroModifiers = [.fade, .translate(x: 0, y: 50, z: 0)]
        calculateButton.heroModifiers = [.fade, .scale(0.5)]
    }

    func roundOffPopUpCorners() {
        currentGradeInfoView.layer.cornerRadius = 10
        examWeightInfoView.layer.cornerRadius   = 10
        desiredGradeInfoView.layer.cornerRadius = 10
        gradeMateButtonView.layer.cornerRadius  = 10
        classesView.layer.cornerRadius          = 10
        classesScrollView.layer.cornerRadius    = 10
    }

    func setAllButtonStyles() {
        setButtonStyle(button: calculateButton, buttonColor: calculateButtonColor, shadowColor: calculateButtonShadow)
        setButtonStyle(button: currentGradeButton, buttonColor: upperButtonColors, shadowColor: upperButtonShadows)
        setButtonStyle(button: examWeightButton, buttonColor: upperButtonColors, shadowColor: upperButtonShadows)
        setButtonStyle(button: desiredGradeButton, buttonColor: upperButtonColors, shadowColor: upperButtonShadows)
        setButtonStyle(button: currentGradeInfoDismiss, buttonColor: calculateButtonColor, shadowColor: calculateButtonShadow, isDismiss: true)
        setButtonStyle(button: examWeightInfoDismiss, buttonColor: calculateButtonColor, shadowColor: calculateButtonShadow, isDismiss: true)
        setButtonStyle(button: desiredGradeInfoDismiss, buttonColor: calculateButtonColor, shadowColor: calculateButtonShadow, isDismiss: true)
        setButtonStyle(button: resultViewDismissButton, buttonColor: upperButtonColors, shadowColor: upperButtonShadows, isDismiss: true)
        setButtonStyle(button: gradeMateButton, buttonColor: .clear, shadowColor: .clear, shadowHeight: 5.0)
        setButtonStyle(button: gradeMateButtonShadow, buttonColor: .clear, shadowColor: .clear, textColor: .asbestos(), shadowHeight: 5.0)
        setButtonStyle(button: gradeMateButtonViewBackButton, buttonColor: calculateButtonColor, shadowColor: calculateButtonShadow)
        setButtonStyle(button: shareLinkButton, buttonColor: upperButtonColors, shadowColor: upperButtonShadows, isDismiss: true)
        setButtonStyle(button: writeReviewButton, buttonColor: upperButtonColors, shadowColor: upperButtonShadows, isDismiss: true)

        setButtonStyle(button: classesBackButton, buttonColor: .concrete(), shadowColor: .asbestos())
    }

    func setAllButtonTextBehavior() {
        currentGradeButton.titleLabel?.numberOfLines      = 2
        desiredGradeButton.titleLabel?.numberOfLines      = 2
        examWeightButton.titleLabel?.numberOfLines        = 2
        calculateButton.titleLabel?.numberOfLines         = 1
        currentGradeInfoDismiss.titleLabel?.numberOfLines = 1
        examWeightInfoDismiss.titleLabel?.numberOfLines   = 1
        desiredGradeInfoDismiss.titleLabel?.numberOfLines = 1
    }

    @objc func longTap(_ sender: UIGestureRecognizer) {
        if sender.state == .began {
            animateIn(viewToAnimate: self.classesView, height: 485)
        }
    }

    func addLongPressToExamWeightButton() {
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(longTap(_:)))
        examWeightButton.addGestureRecognizer(longGesture)
    }

    func createClassButtonPages() -> [ClassButtonPage] {
        let page1: ClassButtonPage = Bundle.main.loadNibNamed("ClassButtonPage", owner: self, options: nil)?.first as! ClassButtonPage

        page1.button1.setTitle("5%", for: .normal)
        page1.button2.setTitle("10%", for: .normal)
        page1.button3.setTitle("15%", for: .normal)
        page1.button4.setTitle("20%", for: .normal)
        page1.button5.setTitle("25%", for: .normal)

        let page2: ClassButtonPage = Bundle.main.loadNibNamed("ClassButtonPage", owner: self, options: nil)?.first as! ClassButtonPage
        page2.button1.setTitle("30%", for: .normal)
        page2.button2.setTitle("35%", for: .normal)
        page2.button3.setTitle("40%", for: .normal)
        page2.button4.setTitle("45%", for: .normal)
        page2.button5.setTitle("50%", for: .normal)

        setButtonStyle(button: page1.button1)
        setButtonStyle(button: page1.button2)
        setButtonStyle(button: page1.button3)
        setButtonStyle(button: page1.button4)
        setButtonStyle(button: page1.button5)

        setButtonStyle(button: page2.button1)
        setButtonStyle(button: page2.button2)
        setButtonStyle(button: page2.button3)
        setButtonStyle(button: page2.button4)
        setButtonStyle(button: page2.button5)

        page1.backgroundColor = .pomegranate()
        page2.backgroundColor = .belizeHole()

        return [page1, page2]
    }

    func setupClassesScrollView(pages: [ClassButtonPage]) {
//        let screenWidth = Int(UIScreen.main.bounds.width)
//        classesView.frame = CGRect(x: 0, y: 0, width: screenWidth - 24, height: 485)
//        classesView.center = self.view.center
        classesScrollView.delegate = self
        classesScrollView.isPagingEnabled = true
        classesScrollView.showsHorizontalScrollIndicator = false
//        classesScrollView.frame = CGRect(x: 0, y: 0, width: screenWidth - 56, height: 323)
//        classesScrollView.center = classesView.center
        classesScrollView.contentSize = CGSize(width: CGFloat(screenWidth - (16 * 2) - (12 * 2)) * CGFloat(pages.count), height: classesScrollView.frame.height)

        for (index, page) in pages.enumerated() {
            page.frame = CGRect(x: classesScrollView.frame.width * CGFloat(index), y: 0, width: classesScrollView.frame.width, height: classesScrollView.frame.height)
            classesScrollView.addSubview(page)
        }
    }
}

extension UIViewController {
    // MARK: - SET BUTTON STYLE
    func setButtonStyle(button: FUIButton, buttonColor: UIColor = .turquoise(), shadowColor: UIColor = .greenSea(), textColor: UIColor = .clouds(), shadowHeight: CGFloat = 6.0, cornerRadius: CGFloat = 6.0, isDismiss: Bool = false) {

        button.shadowHeight = shadowHeight
        button.buttonColor  = buttonColor
        button.shadowColor  = shadowColor
        button.cornerRadius = isDismiss ? button.frame.height / 2 : cornerRadius

        button.setTitleColor(textColor, for: .normal)
        button.setTitleColor(textColor, for: .highlighted)
        button.backgroundColor = .clear

        button.isExclusiveTouch = true
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.adjustsFontSizeToFitWidth = true
    }
}
