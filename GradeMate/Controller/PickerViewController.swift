import Foundation
import FlatUIKit
import Haptica
import NightNight
import PickerView
import WhatsNewKit

class PickerViewController: UIViewController {
    let FONT_NAME = "Fredoka One"

    var currentGrade = 0
    var decimalValue = 0.0
    var examWeight   = 0
    var desiredGrade = 0
    var scoreValue   = 0.0

    var currentClass = 0
    
    var warning      = ""
    var dismiss      = ""
    var value        = ""
    
    var effect: UIVisualEffect!
    
    var statusBarIsHidden: Bool = true {
        didSet {
            UIView.animate(withDuration: 0.3) { () -> Void in
                self.setNeedsStatusBarAppearanceUpdate()
            }
        }
    }

    let screenWidth = UIScreen.main.bounds.width

    @IBOutlet weak var picker1: PickerView!
    @IBOutlet weak var picker2: PickerView!
    @IBOutlet weak var picker3: PickerView!
    @IBOutlet weak var picker4: PickerView!
    
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    @IBOutlet var resultView: UIView!
    @IBOutlet weak var resultViewMessageLabel: UILabel!
    @IBOutlet weak var resultViewScoreLabel: UILabel!
    @IBOutlet weak var resultViewWarningLabel: UILabel!
    @IBOutlet weak var resultViewDismissButton: FUIButton!
    
    let currentGradeNumberValues: [Int] = {
        var nums = [Int]()
        
        for i in (1...100).reversed() {
            nums.append(i)
        }
        
        return nums
    }()
    
    let currentGradeDecimalValues: [Double] = {
        var nums = [Double]()
        
        for i in 0...9 {
            nums.append(Double(i) / 10.0)
        }
        
        return nums
    }()
    
    let examWeightValues: [Int] = {
        var nums = [Int]()
        
        for i in 1...100 {
            nums.append(i)
        }
        
        return nums
    }()
    
    let desiredGradeValues: [Int] = {
        var nums = [Int]()
        
        for i in (1...100).reversed() {
            nums.append(i)
        }
        
        return nums
    }()
    
    let currentGradeNumberStrings: [String] = {
        var strNums = [String]()
        
        for i in (1...100).reversed() {
            strNums.append(String(i))
        }
        
        return strNums
    }()
    
    let currentGradeDecimalStrings: [String] = {
        var strNums = [String]()
        
        for i in 0...9 {
            var stringDecimal = (String(Double(i) / 10.0) + "%")
            
            stringDecimal.remove(at: stringDecimal.startIndex)
            
            strNums.append(stringDecimal)
        }
        
        return strNums
    }()
    
    let examWeightStrings: [String] = {
        var strNums = [String]()
        
        for i in 1...100 {
            strNums.append(String(i) + "%")
        }
        
        return strNums
    }()
    
    let desiredGradeStrings: [String] = {
        var strNums = [String]()
        
        for i in (1...100).reversed() {
            strNums.append(String(i) + "%")
        }
        
        return strNums
    }()
    
    let letterGradientImage = UIImage(named: "GradeGradient")

    let scoreGradientImage = UIImage(named: "ScoreGradient")

    let userDefaults = UserDefaults.standard

    var whatsNewVc = WhatsNewViewController(whatsNew: WhatsNew.init(title: "DEFAULT", items: []))
    var whatsNewOptionalVc = WhatsNewViewController(coder: NSCoder.init())

    override func viewDidLoad() {
        self.view.hero.isEnabled = true
        
        configurePicker(picker: picker1, stringArray: currentGradeNumberStrings)
        configurePicker(picker: picker2, stringArray: currentGradeDecimalStrings)
        configurePicker(picker: picker3, stringArray: examWeightStrings)
        configurePicker(picker: picker4, stringArray: desiredGradeStrings)
        
        setCurrentGrade(val: 100)
        setDecimalValue(val: 0.1)
        setExamWeight(val: 1)
        setDesiredGrade(val: 100)
        
        effect = visualEffectView.effect         // STORES EFFECT IN VAR TO USE LATER IN ANIMATION
        visualEffectView.effect = nil            // TURNS OFF BLUR WHEN VIEW LOADS
        visualEffectView.isHidden = true         // HIDES BLUR EFFECT SO BUTTONS CAN BE USED
        
        resultView.layer.cornerRadius = 10
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        showWhatsNewIfNeeded()
    }

    func showWhatsNewIfNeeded() {
        let items = [
            WhatsNew.Item(
                title: "Dark theme",
                subtitle: "Cause all the cool apps have one",
                image: UIImage(named: "icon-moon")),
            WhatsNew.Item(
                title: "GradeMate menu",
                subtitle: "Tap the 'GradeMate' button for some options",
                image: UIImage(named: "icon-toggle-on")),
            WhatsNew.Item(
                title: "Haptic feedback",
                subtitle: "Feel the clickiness",
                image: UIImage(named: "icon-touch")),
            WhatsNew.Item(
                title: "New font",
                subtitle: "Simple and clean",
                image: UIImage(named: "icon-font")),
            WhatsNew.Item(
                title: "This page",
                subtitle: "Easily see what's new",
                image: UIImage(named: "icon-new")),
        ]

        let itemsView = WhatsNewViewController.ItemsView(
            titleFont: UIFont(name: FONT_NAME, size: 24)!,
            titleColor: .clouds(),
            subtitleFont: UIFont(name: FONT_NAME, size: 18)!,
            subtitleColor: .clouds(),
            imageSize: .preferred
        )

        let titleView = WhatsNewViewController.TitleView(
            titleFont: UIFont(name: FONT_NAME, size: 32)!,
            titleColor: .clouds()
        )

        let theme = WhatsNewViewController.Theme { configuration in
            configuration.apply(animation: .slideUp)
        }

//        let detailButton = WhatsNewViewController.DetailButton(
//            title: "See this again in the GradeMate menu",
//            action: .custom(action: { vc in () } ),
//            titleFont: UIFont(name: FONT_NAME, size: 18)!,
//            titleColor: .clouds()
//        )

        let completionButton = WhatsNewViewController.CompletionButton(
            title: "Alright!",
            backgroundColor: .greenSea(),
            titleFont: UIFont(name: FONT_NAME, size: 20)!,
            titleColor: .clouds(),
            cornerRadius: 6.0
        )

        let optionalConfig = WhatsNewViewController.Configuration(
            theme: theme,
            backgroundColor: .wetAsphalt(),
            titleView: titleView,
            itemsView: itemsView,
//            detailButton: detailButton,
            completionButton: completionButton
        )

        let config = WhatsNewViewController.Configuration(
            theme: theme,
            backgroundColor: .wetAsphalt(),
            titleView: titleView,
            itemsView: itemsView,
            completionButton: completionButton
        )

        let whatsNew = WhatsNew(title: "What's New", items: items)

//        whatsNewVc = WhatsNewViewController(whatsNew: whatsNew, configuration: config)

//        let newButton = FUIButton(frame: CGRect(x: 0, y: 100, width: 200, height: 20))
//        let newButton = FUIButton(type: .custom)
//        newButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
//        newButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
//        newButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
//
//        setButtonStyle(button: newButton)
//
//        whatsNewVc.view.addSubview(newButton)

//        self.present(whatsNewVc, animated: true)

        let keyValueVersionStore = KeyValueWhatsNewVersionStore(keyValueable: userDefaults)

        whatsNewVc         = WhatsNewViewController(whatsNew: whatsNew, configuration: config)
        whatsNewOptionalVc = WhatsNewViewController(whatsNew: whatsNew, configuration: optionalConfig, versionStore: keyValueVersionStore)

        if let vc = whatsNewOptionalVc {
            self.present(vc, animated: true)
        }
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    override var prefersStatusBarHidden: Bool {
        return statusBarIsHidden
    }
    
    func configurePicker(picker: PickerView, stringArray: [String]) {
        picker.dataSource = self
        picker.delegate   = self
        picker.backgroundColor = .clear
        picker.scrollingStyle  = .default
        picker.selectionStyle  = .defaultIndicator
        picker.currentSelectedRow = stringArray.firstIndex(of: stringArray.first!)
    }

    public func setCurrentClass(val: Int) {
//        self.picker3.selectRow(val, animated: true)
        print(val)
    }
}

extension PickerViewController: PickerViewDataSource {
    func pickerView(_ pickerView: PickerView, titleForRow row: Int) -> String {
        switch pickerView {
            case picker1:
                return currentGradeNumberStrings[row]
            case picker2:
                return currentGradeDecimalStrings[row]
            case picker3:
                return examWeightStrings[row]
            case picker4:
                return desiredGradeStrings[row]
            default: return ""
        }
    }

    func pickerViewNumberOfRows(_ pickerView: PickerView) -> Int {
        switch pickerView {
            case picker1:
                return currentGradeNumberStrings.count
            case picker2:
                return currentGradeDecimalStrings.count
            case picker3:
                return examWeightStrings.count
            case picker4:
                return desiredGradeStrings.count
            default: return 0
        }
    }
}

extension PickerViewController: PickerViewDelegate {
    func pickerViewHeightForRows(_ pickerView: PickerView) -> CGFloat {
        return 35.0
    }
    
    func pickerView(_ pickerView: PickerView, didSelectRow row: Int) {
        switch pickerView {
            case picker1:
                setCurrentGrade(val: currentGradeNumberValues[row])
            case picker2:
                setDecimalValue(val: currentGradeDecimalValues[row])
            case picker3:
                setExamWeight(val: examWeightValues[row])
            case picker4:
                setDesiredGrade(val: desiredGradeValues[row])
            default: break
        }

        calculate(currentGradeInt: getCurrentGrade(), decimalValue: getDecimalValue(), examWeightInt: getExamWeight(), desiredGradeInt: getDesiredGrade())

        setGradeValue(value: String(format: "%.0f", getScoreValue()) + "%")

        checkScoreValue(value: self.scoreValue)

        self.resultViewScoreLabel.text = getValue()
        self.resultViewWarningLabel.text = getWarning()
        self.resultViewDismissButton.setTitle(getDismiss(), for: .normal)

        self.resultViewScoreLabel.mixedTextColor   = MixedColor(normal: .black, night: .clouds())
        self.resultViewWarningLabel.mixedTextColor = MixedColor(normal: .black, night: .clouds())
        self.resultViewMessageLabel.mixedTextColor = MixedColor(normal: .black, night: .clouds())
    }
    
    func pickerView(_ pickerView: PickerView, styleForLabel label: UILabel, highlighted: Bool) {
        label.textAlignment = .center
//        label.font = UIFont(name: "Courier-Bold", size: 26.0)
//        label.font = UIFont(name: "FredokaOne-Regular", size: 26)
        label.font = UIFont(name: "Quicksand-Bold", size: 26)

        if pickerView == picker2 {
            label.textAlignment = .left
        }
        
        if (highlighted) {
            label.textColor = .clouds()
            switch pickerView {
            case picker1:
                let itemTextInt = Int(label.text!)
                let coords = CGPoint(x: 0, y: ((itemTextInt!)-1))
                picker1.defaultSelectionIndicator.backgroundColor = letterGradientImage?.getPixelColor(pos: coords)
            case picker2:
                picker2.defaultSelectionIndicator.backgroundColor = .clear
            case picker3:
                picker3.defaultSelectionIndicator.backgroundColor = .clear
            case picker4:
                let labelText = label.text!
                let strIndex = labelText.firstIndex(of: "%")!
                let subString = String(labelText[..<strIndex])
                let itemTextInt = Int(subString)
                let coords = CGPoint(x: 0, y: ((itemTextInt!)-1))
                picker4.defaultSelectionIndicator.backgroundColor = letterGradientImage?.getPixelColor(pos: coords)
            default: break
            }
        } else {
            label.textColor = .silver()
        }
    }
    
    func pickerView(_ pickerView: PickerView, viewForRow row: Int, index: Int, highlighted: Bool, reusingView view: UIView?) -> UIView? {
        return nil
    }
}

extension PickerViewController {
    func calculate(currentGradeInt: Int, decimalValue: Double, examWeightInt: Int, desiredGradeInt: Int) {
        let currentGrade = (Double(currentGradeInt) + decimalValue) / 100.0
        
        let examWeight = Double(examWeightInt) / 100.0
        
        let desiredGrade = Double(desiredGradeInt) / 100.0
        
        setScoreValue(val: floor((( desiredGrade - (1 - examWeight) * currentGrade) / examWeight) * 100))

//        resultViewScoreLabel.textColor = setScoreValueColor(val: getScoreValue())
    }

    func animateIn(viewToAnimate: UIView, height: Int) {
        self.visualEffectView.isHidden = false
//        viewToAnimate.translatesAutoresizingMaskIntoConstraints = false

        viewToAnimate.frame = CGRect(x: 0, y: 0, width: Int(UIScreen.main.bounds.width) - 24, height: height)
        viewToAnimate.center = self.view.center

//        // SET CONSTRAINTS TO AVOID CLIPPING ON SMALL SCREENS
//        let leading = NSLayoutConstraint(item: viewToAnimate, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 12)
//        let trailing = NSLayoutConstraint(item: viewToAnimate, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 12)
//        let centerX = NSLayoutConstraint(item: viewToAnimate, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
//        let centerY = NSLayoutConstraint(item: viewToAnimate, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
//        let heightConstraint = NSLayoutConstraint(item: viewToAnimate, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: CGFloat(height))
//        NSLayoutConstraint.activate([leading, trailing, heightConstraint, centerX, centerY])

//        viewToAnimate.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)    // MAKE POP UP VIEW SLIGHTLY BIGGER BEFORE IT IS DISPLAYED
        viewToAnimate.alpha = 0
        self.view.addSubview(viewToAnimate)

        // ANIMATE POP UP, RETURNING IT TO ITS NORMAL STATE (IDENTITY)
        UIView.animate(withDuration: 0.3, animations: {
            self.visualEffectView.effect = self.effect
            viewToAnimate.alpha = 1
//            viewToAnimate.transform = CGAffineTransform.identity
        })

        statusBarIsHidden = true
    }

    public func animateOut(viewToAnimate: UIView) {
        UIView.animate(withDuration: 0.3, animations: {
//            viewToAnimate.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            viewToAnimate.alpha = 0

            self.visualEffectView.effect = nil

        }) { (success:Bool) in
            viewToAnimate.removeFromSuperview()
            self.visualEffectView.isHidden = true
        }

        statusBarIsHidden = false
    }

    @IBAction func dismissPopUp(_ sender: FUIButton) {
        animateOut(viewToAnimate: self.resultView)
    }
    
    func getCurrentGrade() -> Int {
        return self.currentGrade
    }
    
    func getDecimalValue() -> Double {
        return self.decimalValue
    }
    
    func getExamWeight() -> Int {
        return self.examWeight
    }
    
    func getDesiredGrade() -> Int {
        return self.desiredGrade
    }
    
    func getScoreValue() -> Double {
        return self.scoreValue
    }
    
    func getWarning() -> String {
        return self.warning
    }
    
    func getDismiss() -> String {
        return self.dismiss
    }
    
    func getValue() -> String {
        return self.value
    }
    
    func setCurrentGrade(val: Int) {
        self.currentGrade = val
    }
    
    func setDecimalValue(val: Double) {
        self.decimalValue = val
    }
    
    func setExamWeight(val: Int) {
        self.examWeight = val
    }
    
    func setDesiredGrade(val: Int) {
        self.desiredGrade = val
    }
    
    func setScoreValue(val: Double) {
        self.scoreValue = val
    }
    
    func setWarning(warning: String) {
        self.warning = warning
    }
    
    func setDismiss(message: String) {
        self.dismiss = message
    }
    
    func setGradeValue(value: String) {
        self.value = value
    }
    
    func checkScoreValue(value: Double) {
        switch Int(value) {
            case let x where x > 300:
                setWarning(warning: "I think it's safe to say that this is not your best subject.")
                setDismiss(message: "No 💩, Sherlock")
                break

            case let x where x > 200:
                setWarning(warning: "Bribery is your only hope at this point...")
                setDismiss(message: "I would never...😈")
                break

            case let x where x > 150:
                setWarning(warning: "It's okay to cry...")
                setDismiss(message: "Already am 😭")
                break

            case let x where x > 125:
                setWarning(warning: "It's not lookin' good for you...")
                setDismiss(message: "I surrender 🏳")
                break

            case let x where x > 115:
                setWarning(warning: "You shall not pass! ✋")
                setDismiss(message: "Thanks, Gandalf 😐")
                break

            case let x where x > 100:
                setWarning(warning: "Is there extra credit? 😬")
                setDismiss(message: "I'll look into it 🙄")
                break

            case let x where x == 100:
                setWarning(warning: "May the Force be with you...")
                setDismiss(message: "Thank you, Master 🙏")
                break

            case let x where x >= 90:
                setWarning(warning: "I have faith in you.")
                setDismiss(message: "Thanks bro 😅")
                break

            case let x where x >= 80:
                setWarning(warning: "You got this.")
                setDismiss(message: "It's possible 🤔")
                break

            case let x where x >= 70:
                setWarning(warning: "Not so bad.")
                setDismiss(message: "Alright 😛")
                break

            case let x where x >= 60:
                setWarning(warning: "Piece o' cake.")
                setDismiss(message: "Yes please 🍰")
                break

            case let x where x >= 50:
                setWarning(warning: "No problemo.")
                setDismiss(message: "I can do that 😃")
                break

            case let x where x > 0:
                setWarning(warning: "You could bomb it.")
                setDismiss(message: "Chill 👌")
                break

            case let x where x <= 0:
                setWarning(warning: "Don't even take the test, dude.")
                setDismiss(message: "Sweeeet 😎")
                break

            default: break
        }
    }

    func setScoreValueColor(val: Double) -> UIColor {
        let score = Int(val)
        let coords = CGPoint(x: 0, y: score)

        switch score {
            case let x where x >= 0:
                return (scoreGradientImage?.getPixelColor(pos: coords))!
            case let x where x <= 100:
                return (scoreGradientImage?.getPixelColor(pos: coords))!
            case let x where x > 100:
                return (scoreGradientImage?.getPixelColor(pos: CGPoint(x: 0, y: 0)))!
            case let x where x < 0:
                return (scoreGradientImage?.getPixelColor(pos: CGPoint(x: 0, y: 100)))!
            default:
                return UIColor.black
        }
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
