import CHIPageControl
import FlatUIKit
import Haptica
import Hero
import NightNight
import PickerView
import WhatsNewKit

class FinalCalculatorViewController: PickerViewController, UIScrollViewDelegate {
    @IBOutlet var gradeMateButtonView: UIView!
    @IBOutlet weak var shareLinkButton: FUIButton!
    @IBOutlet weak var writeReviewButton: FUIButton!
    @IBOutlet weak var changeThemeButton: FUIButton!
    @IBOutlet weak var gradeMateButtonViewBackButton: FUIButton!
    @IBOutlet weak var sendLinkLabel: UILabel!
    @IBOutlet weak var writeReviewLabel: UILabel!
    @IBOutlet weak var changeThemeLabel: UILabel!
    @IBOutlet weak var gradeMateViewTitleLabel: UILabel!

    @IBOutlet var currentGradeInfoView: UIView!
    @IBOutlet weak var currentGradeInfoTitleLabel: UILabel!
    @IBOutlet weak var currentGradeInfoMessageLabel: UILabel!
    @IBOutlet weak var currentGradeInfoDismiss: FUIButton!

    @IBOutlet var examWeightInfoView: UIView!
    @IBOutlet weak var examWeightInfoTitleLabel: UILabel!
    @IBOutlet weak var examWeightInfoMessageLabel: UILabel!
    @IBOutlet weak var examWeightInfoDismiss: FUIButton!

    @IBOutlet var desiredGradeInfoView: UIView!
    @IBOutlet weak var desiredGradeInfoTitleLabel: UILabel!
    @IBOutlet weak var desiredGradeInfoMessageLabel: UILabel!
    @IBOutlet weak var desiredGradeInfoDismiss: FUIButton!

    @IBOutlet weak var currentGradeButton: FUIButton!
    @IBOutlet weak var examWeightButton: FUIButton!
    @IBOutlet weak var desiredGradeButton: FUIButton!
    
    @IBOutlet weak var gradeMateButton: FUIButton!
    @IBOutlet weak var gradeMateButtonShadow: FUIButton!
    
    @IBOutlet weak var calculateButton: FUIButton!

    @IBOutlet var classesView: UIView!
    @IBOutlet weak var classesViewTitleLabel: UILabel!
    @IBOutlet weak var classesScrollView: UIScrollView!
    @IBOutlet weak var classesBackButton: FUIButton!
    @IBOutlet weak var classesPageControl: CHIPageControlJaloro!

    @IBOutlet weak var backgroundImage: UIImageView!

    let APP_ID = "1142404187"
    let SHARE_URL_STRING = "https://appsto.re/us/Br7feb.i"
    let USER_DEFAULTS_KEY_FOR_THEME = "theme"
    let USER_DEFAULTS_KEY_FOR_SELECTED_CLASS = "selectedClass"
    let USER_DEFAULTS_KEY_FOR_SELECTED_CLASS_IS_ACTIVE = "selectedClassIsActive"
    let USER_DEFAULTS_KEY_FOR_ALREADY_ROLLED_TO_CLASS = "alreadyRolledToClass"

    let CLASSES_VIEW_POPUP_HEIGHT = 485
    let CLASSES_PAGE_CONTROL_RADIUS:  CGFloat = 3
    let CLASSES_PAGE_CONTROL_PADDING: CGFloat = 8
    let CLASSES_SCROLLVIEW_NORMAL_COLOR: UIColor = .silver()!
    let CLASSES_SCROLLVIEW_NIGHT_COLOR: UIColor = .midnightBlue()!

    let INFO_VIEW_POPUP_HEIGHT = 230
    let POPUP_VIEW_CORNER_RADIUS: CGFloat = 10

    let GRADEMATE_BUTTON_VIEW_HEIGHT = 486
    let CALCULATE_BUTTON_VIEW_HEIGHT = 270
    let SMALL_SCREEN_HEIGHT: CGFloat = 480

    let STATUS_BAR_DISMISS_DELAY = 0.35

    let DEFAULT_VIEW_NORMAL_COLOR: UIColor = .clouds()!
    let DEFAULT_VIEW_NIGHT_COLOR:  UIColor = .wetAsphalt()!

    var primaryColors         = MixedColor(normal: 0x1ABC9C, night: 0x1ABC9C)
    let PRIMARY_SHADOW_COLORS = MixedColor(normal: 0x16A085, night: 0x16A085)

    let SECONDARY_COLORS        = MixedColor(normal: 0x18C0EE, night: 0x18C0EE)
    let SECONDARY_SHADOW_COLORS = MixedColor(normal: 0x149EC6, night: 0x149EC6)

    let DEFAULT_NORMAL_TEXT_COLOR: UIColor = .black
    let DEFAULT_NIGHT_TEXT_COLOR:  UIColor = .clouds()!

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

    var savedClassesPage1: ClassButtonPage = Bundle.main.loadNibNamed("ClassButtonPage", owner: self, options: nil)?.first as! ClassButtonPage
    var savedClassesPage2: ClassButtonPage = Bundle.main.loadNibNamed("ClassButtonPage", owner: self, options: nil)?.first as! ClassButtonPage

    var defaultTextColors = MixedColor(normal: .red, night: .red)

    // MARK: - VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()

        self.hero.isEnabled = true

        let pages: [ClassButtonPage] = createClassButtonPages()
        setupClassesScrollView(pages: pages)

        setDefaultTextColors(DEFAULT_NORMAL_TEXT_COLOR, DEFAULT_NIGHT_TEXT_COLOR)

        self.view.mixedBackgroundColor = MixedColor(normal: 0x222F3E, night: 0x222F3E)

        setThemeAtLaunch()

        setAlreadyRolledToSelectedClassAtLaunch()

        checkForSmallScreen()

        delayStatusBar()

        addAnimations()

        roundOffPopUpCorners()

        setAllButtonStyles()

        setBackgroundImageAlphaBasedOnCurrentTheme()

        setAllButtonTextBehavior()

        // FIXME: Leave commented until Saved Classes are ready
//        addLongPressToButton(button: examWeightButton, method: #selector(examWeightLongTap(_:)))

        setUpClassesPageControl(pages)

        resetSelectedClassIsActiveToFalseAtLaunch()
    }

    // MARK: - GRADEMATE BUTTON
    @IBAction func gradeMateButtonTapped(_ sender: FUIButton) {
        gradeMateButtonShadow.isHidden = false
        animateIn(viewToAnimate: self.gradeMateButtonView, height: GRADEMATE_BUTTON_VIEW_HEIGHT)
    }

    @IBAction func gradeMateButtonDown(_ sender: FUIButton) {
        gradeMateButtonShadow.isHidden = true
    }

    @IBAction func gradeMateButtonTouchDragExit(_ sender: FUIButton) {
        gradeMateButtonShadow.isHidden = false
    }

    @IBAction func gradeMateButtonTouchDragEnter(_ sender: FUIButton) {
        gradeMateButtonShadow.isHidden = true
    }

    // MARK: GRADEMATE VIEW BUTTONS
    @IBAction func gradeMateButtonViewBackButtonPressed(_ sender: FUIButton) {
        animateOut(viewToAnimate: self.gradeMateButtonView)
    }

    @IBAction func gradeMateButonViewWriteReviewPressed(_ sender: FUIButton) {
        let urlString = "itms-apps://itunes.apple.com/app/viewContentsUserReviews?id=\(APP_ID)"
        let url = URL(string: urlString)!

        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }

    @IBAction func gradeMateButtonViewShareButton(_ sender: FUIButton) {
        let url = URL(string: SHARE_URL_STRING)!

        showShareSheet(itemsToShare: [url])
    }

    fileprivate func setThemeAtLaunch() {
        if userDefaults.object(forKey: USER_DEFAULTS_KEY_FOR_THEME) == nil {
            userDefaults.set(1, forKey: USER_DEFAULTS_KEY_FOR_THEME)
        } else {
            NightNight.theme = userDefaults.integer(forKey: USER_DEFAULTS_KEY_FOR_THEME) == 1 ? .normal : .night
            changeThemeButton.setTitle(NightNight.theme == .night ? "Go light ☀️" : "Go dark 🌙", for: .normal)
        }
    }

    fileprivate func setAlreadyRolledToSelectedClassAtLaunch() {
        userDefaults.set(true, forKey: USER_DEFAULTS_KEY_FOR_ALREADY_ROLLED_TO_CLASS)
    }

    fileprivate func resetSelectedClassIsActiveToFalseAtLaunch() {
        userDefaults.set(false, forKey: USER_DEFAULTS_KEY_FOR_SELECTED_CLASS_IS_ACTIVE)
    }

    @IBAction func changeThemeButtonPressed(_ sender: FUIButton) {
        NightNight.toggleNightTheme()

        let currentThemeAsInt = NightNight.theme == .normal ? 1 : 0
        UserDefaults.standard.set(currentThemeAsInt, forKey: USER_DEFAULTS_KEY_FOR_THEME)

        setAllButtonStyles()
        setBackgroundImageAlphaBasedOnCurrentTheme()

        changeThemeButton.setTitle(NightNight.theme == .night ? "Go light ☀️" : "Go dark 🌙", for: .normal)
    }

    // MARK: SAVED CLASSES VIEW
    func setUpClassesPageControl(_ pages: [ClassButtonPage]) {
        classesPageControl.numberOfPages = pages.count
        classesPageControl.radius = CLASSES_PAGE_CONTROL_RADIUS
        classesPageControl.tintColor = .greenSea()
        classesPageControl.currentPageTintColor = .greenSea()
        classesPageControl.padding = CLASSES_PAGE_CONTROL_PADDING
        classesPageControl.backgroundColor = .clear
    }

    // MARK: - DISMISS POP UP
    //    @IBAction func dismissPopUp(_ sender: FUIButton) {
    //        animateOut(viewToAnimate: self.view.subviews.last!)
    //    }


    @IBAction func savedClassesBackPressed(_ sender: FUIButton) {
        animateOut(viewToAnimate: self.view.subviews.last!)

        let selectedClass = self.userDefaults.integer(forKey: USER_DEFAULTS_KEY_FOR_SELECTED_CLASS)
        let alreadyRolledToClass = self.userDefaults.bool(forKey: USER_DEFAULTS_KEY_FOR_ALREADY_ROLLED_TO_CLASS)

        if (selectedClass != -1 && !alreadyRolledToClass) {
            self.picker3.selectRow(self.userDefaults.integer(forKey: "selectedClass") - 1, animated: true)
            userDefaults.set(true, forKey: USER_DEFAULTS_KEY_FOR_ALREADY_ROLLED_TO_CLASS)
        }
    }

    // MARK: - INFO BUTTONS
    @IBAction func currentGradeTapped(_ sender: FUIButton) {
        animateIn(viewToAnimate: self.currentGradeInfoView, height: INFO_VIEW_POPUP_HEIGHT)
    }
    
    @IBAction func weightButtonTapped(_ sender: FUIButton) {
        animateIn(viewToAnimate: self.examWeightInfoView, height: INFO_VIEW_POPUP_HEIGHT)
    }
    
    @IBAction func desiredGradeTapped(_ sender: FUIButton) {
        animateIn(viewToAnimate: self.desiredGradeInfoView, height: INFO_VIEW_POPUP_HEIGHT)
    }

    // MARK: - DISMISS POP UPS
    @IBAction func currentGradeInfoDismiss(_ sender: FUIButton) {
        animateOut(viewToAnimate: self.currentGradeInfoView)
    }
    
    @IBAction func examWeightInfoDismiss(_ sender: FUIButton) {
        animateOut(viewToAnimate: self.examWeightInfoView)
    }
    
    @IBAction func desiredGradeInfoDismiss(_ sender: FUIButton) {
        animateOut(viewToAnimate: self.desiredGradeInfoView)
    }
    
    
    // MARK: - SHOW SHARE SHEET
    func showShareSheet(itemsToShare: [Any]) {
        let activityVC = UIActivityViewController(activityItems: itemsToShare, applicationActivities: nil)
        
        let excludedActivities: [UIActivity.ActivityType] = [
            .addToReadingList,
            .assignToContact,
            .postToFlickr,
            .postToTencentWeibo,
            .postToWeibo,
            .postToVimeo,
            .print,
            .saveToCameraRoll
        ]
        
        activityVC.excludedActivityTypes = excludedActivities
        
        activityVC.popoverPresentationController?.sourceView = self.view
        
        self.present(activityVC, animated: true, completion: nil)
    }

    func showWhatsNewPage() {
        self.present(whatsNewVc, animated: true)
    }

    fileprivate func setBackgroundImageAlphaBasedOnCurrentTheme() {
        if (NightNight.theme == .normal) {
            UIView.animate(withDuration: 0.3, animations: {
                self.backgroundImage.alpha = 1
            }) { (success:Bool) in }
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                self.backgroundImage.alpha = 0
            }) { (success:Bool) in }
        }
    }

    // MARK: - CALCULATE BUTTON TAPPED
    @IBAction func calculateTapped(_ sender: FUIButton) {
        animateIn(viewToAnimate: self.resultView, height: CALCULATE_BUTTON_VIEW_HEIGHT)

        //        // CHANGE BUTTON TEXT
        //        let arraySize = calculateButtonWords.count
        //        let randNum   = arc4random_uniform(UInt32(arraySize))
        //        let randInt    = Int(randNum)
        //        calculateButton.setTitle(calculateButtonWords[randInt], for: .normal)
    }

    func checkForSmallScreen() {
        if (UIScreen.main.bounds.size.height == SMALL_SCREEN_HEIGHT) {
            gradeMateButton.isHidden = true
            gradeMateButtonShadow.isHidden = true
        }
    }

    func delayStatusBar() {
        DispatchQueue.main.asyncAfter(deadline: (.now() + STATUS_BAR_DISMISS_DELAY)) {
            self.statusBarIsHidden = false
        }
    }

    func addAnimations() {
        gradeMateButton.hero.modifiers       = [.fade, .scale(0.5)]
        gradeMateButtonShadow.hero.modifiers = [.fade, .scale(0.5)]
        currentGradeButton.hero.modifiers    = [.fade, .translate(x: -50, y: 0, z: 0)]
        examWeightButton.hero.modifiers      = [.fade, .scale(0.5)]
        desiredGradeButton.hero.modifiers    = [.fade, .translate(x: 50, y: 0, z: 0)]
        calculateButton.hero.modifiers       = [.fade, .scale(0.5)]
        picker1.hero.modifiers = [.fade, .translate(x: 0, y: 50, z: 0)]
        picker2.hero.modifiers = [.fade, .translate(x: 0, y: 50, z: 0)]
        picker3.hero.modifiers = [.fade, .translate(x: 0, y: 50, z: 0)]
        picker4.hero.modifiers = [.fade, .translate(x: 0, y: 50, z: 0)]
    }

    func roundOffPopUpCorners() {
        currentGradeInfoView.layer.cornerRadius = POPUP_VIEW_CORNER_RADIUS
        examWeightInfoView.layer.cornerRadius   = POPUP_VIEW_CORNER_RADIUS
        desiredGradeInfoView.layer.cornerRadius = POPUP_VIEW_CORNER_RADIUS
        gradeMateButtonView.layer.cornerRadius  = POPUP_VIEW_CORNER_RADIUS
        classesView.layer.cornerRadius          = POPUP_VIEW_CORNER_RADIUS
        classesScrollView.layer.cornerRadius    = POPUP_VIEW_CORNER_RADIUS

        resultView.mixedBackgroundColor           = MixedColor(normal: DEFAULT_VIEW_NORMAL_COLOR, night: DEFAULT_VIEW_NIGHT_COLOR)
        examWeightInfoView.mixedBackgroundColor   = MixedColor(normal: DEFAULT_VIEW_NORMAL_COLOR, night: DEFAULT_VIEW_NIGHT_COLOR)
        gradeMateButtonView.mixedBackgroundColor  = MixedColor(normal: DEFAULT_VIEW_NORMAL_COLOR, night: DEFAULT_VIEW_NIGHT_COLOR)
        currentGradeInfoView.mixedBackgroundColor = MixedColor(normal: DEFAULT_VIEW_NORMAL_COLOR, night: DEFAULT_VIEW_NIGHT_COLOR)
        desiredGradeInfoView.mixedBackgroundColor = MixedColor(normal: DEFAULT_VIEW_NORMAL_COLOR, night: DEFAULT_VIEW_NIGHT_COLOR)
        classesView.mixedBackgroundColor          = MixedColor(normal: DEFAULT_VIEW_NORMAL_COLOR, night: DEFAULT_VIEW_NIGHT_COLOR)

        classesScrollView.mixedBackgroundColor = MixedColor(normal: CLASSES_SCROLLVIEW_NORMAL_COLOR, night: CLASSES_SCROLLVIEW_NIGHT_COLOR)

        classesScrollView.subviews.forEach { (view) in
            view.mixedBackgroundColor = MixedColor(normal: CLASSES_SCROLLVIEW_NORMAL_COLOR, night: CLASSES_SCROLLVIEW_NIGHT_COLOR)
        }

        let gradeMateViewLabels = [
            sendLinkLabel,
            writeReviewLabel,
            changeThemeLabel,
            gradeMateViewTitleLabel
        ]

        let allInfoViewLabels = [
            currentGradeInfoTitleLabel,
            currentGradeInfoMessageLabel,
            examWeightInfoTitleLabel,
            examWeightInfoMessageLabel,
            desiredGradeInfoTitleLabel,
            desiredGradeInfoMessageLabel
        ]

        classesViewTitleLabel.mixedTextColor = MixedColor(normal: DEFAULT_NORMAL_TEXT_COLOR, night: DEFAULT_NIGHT_TEXT_COLOR)

        gradeMateViewLabels.forEach { (label) in
            label?.mixedTextColor = getDefaultTextColors()
        }

        allInfoViewLabels.forEach { (label) in
            label?.mixedTextColor = getDefaultTextColors()
        }
    }

    fileprivate func setDefaultTextColors(_ normalColor: UIColor, _ nightColor: UIColor) {
        defaultTextColors = MixedColor(normal: normalColor, night: nightColor)
    }

    fileprivate func getDefaultTextColors() -> MixedColor {
        return MixedColor(normal: DEFAULT_NORMAL_TEXT_COLOR, night: DEFAULT_NIGHT_TEXT_COLOR)
    }

    fileprivate func setSecondaryColors(_ colors: MixedColor) {
        primaryColors = colors
    }

    fileprivate func setInfoButtonStyles() {
        let infoButtons: [FUIButton] = [
            currentGradeButton,
            examWeightButton,
            desiredGradeButton
        ]

        infoButtons.forEach { (button) in
            setButtonStyle(button: button, buttonColor: SECONDARY_COLORS, shadowColor: SECONDARY_SHADOW_COLORS)
        }
    }

    fileprivate func setInfoDismissButtonStyles() {
        let infoDismissButtons: [FUIButton] = [
            currentGradeInfoDismiss,
            examWeightInfoDismiss,
            desiredGradeInfoDismiss
        ]

        infoDismissButtons.forEach { (button) in
            setButtonStyle(button: button, buttonColor: primaryColors, shadowColor: PRIMARY_SHADOW_COLORS, isDismiss: true)
        }
    }

    fileprivate func setGradeMateViewButtonStyles() {
        let gradeMateViewButtons: [FUIButton] = [
            shareLinkButton,
            writeReviewButton,
            changeThemeButton
        ]

        gradeMateViewButtons.forEach { (button) in
            setButtonStyle(button: button, buttonColor: SECONDARY_COLORS, shadowColor: SECONDARY_SHADOW_COLORS, isDismiss: true)
        }
    }

    fileprivate func setSavedClassesButtonStyles() {
        let savedClassesPages = [savedClassesPage1, savedClassesPage2]

        savedClassesPages.forEach { (page) in
            page.getAllButtons().forEach({ (button) in
                setButtonStyle(button: button, buttonColor: MixedColor(normal: .turquoise(), night: .turquoise()), shadowColor: MixedColor(normal: .greenSea(), night: .greenSea()))
            })
        }
    }

    fileprivate func setGradeMateButtonStyles() {
        setButtonStyle(button: gradeMateButton, buttonColor: MixedColor(normal: .clear, night: .clear), shadowColor: MixedColor(normal: .clear, night: .clear), shadowHeight: 5.0)

        setButtonStyle(button: gradeMateButtonShadow, buttonColor: MixedColor(normal: .clear, night: .clear), shadowColor: MixedColor(normal: .clear, night: .clear), textColor: MixedColor(normal: .asbestos(), night: .asbestos()), shadowHeight: 5.0)
    }

    func setAllButtonStyles() {
        setInfoButtonStyles()
        setInfoDismissButtonStyles()
        setGradeMateViewButtonStyles()
        setGradeMateButtonStyles()
        setSavedClassesButtonStyles()

        setButtonStyle(button: calculateButton, buttonColor: primaryColors, shadowColor: PRIMARY_SHADOW_COLORS)

        setButtonStyle(button: resultViewDismissButton, buttonColor: SECONDARY_COLORS, shadowColor: SECONDARY_SHADOW_COLORS, isDismiss: true)

        setButtonStyle(button: gradeMateButtonViewBackButton, buttonColor: primaryColors, shadowColor: PRIMARY_SHADOW_COLORS)

        setButtonStyle(button: classesBackButton, buttonColor: MixedColor(normal: .concrete(), night: .concrete()), shadowColor: MixedColor(normal: .asbestos(), night: .asbestos()))
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

    @objc func examWeightLongTap(_ sender: UIGestureRecognizer) {
        if sender.state == .began {
            animateIn(viewToAnimate: self.classesView, height: CLASSES_VIEW_POPUP_HEIGHT)
        }
    }

    @objc func savedClassLongTap(_ sender: UIGestureRecognizer) {
        if sender.state == .began {
            let button = sender.view as! FUIButton
            print("BUTTON \(button.buttonId + 1) ON PAGE \(button.parentId + 1) LONG PRESSED")
//            animateIn(viewToAnimate: self.classesView, height: CLASSES_VIEW_POPUP_HEIGHT)
        }
    }

    func addLongPressToButton(button: FUIButton, method: Selector) {
        let longGesture = UILongPressGestureRecognizer(target: self, action: method)
        button.addGestureRecognizer(longGesture)
    }

    func createClassButtonPages() -> [ClassButtonPage] {
        for i in (1...5) {
            let buttonOnPage1 = savedClassesPage1.getAllButtons()[i-1]
            buttonOnPage1.setTitle(String(i * 5) + "%", for: .normal)
            setButtonStyle(button: buttonOnPage1)
            buttonOnPage1.tag = i - 1

            let buttonOnPage2 = savedClassesPage2.getAllButtons()[i-1]
            buttonOnPage2.setTitle(String((i+5) * 5) + "%", for: .normal)
            setButtonStyle(button: buttonOnPage2)
            buttonOnPage2.tag = i - 1

            addLongPressToButton(button: buttonOnPage1, method: #selector(savedClassLongTap(_:)))
            addLongPressToButton(button: buttonOnPage2, method: #selector(savedClassLongTap(_:)))
        }

        return [savedClassesPage1, savedClassesPage2]
    }

    func setupClassesScrollView(pages: [ClassButtonPage]) {
        //        let screenWidth = Int(UIScreen.main.bounds.width)
        //        classesView.frame = CGRect(x: 0, y: 0, width: screenWidth - 24, height: 485)
        //        classesView.center = self.view.center
        classesScrollView.delegate = self
        classesScrollView.isPagingEnabled = true
        classesScrollView.showsHorizontalScrollIndicator = false
        classesScrollView.mixedBackgroundColor = MixedColor(normal: .silver(), night: .wetAsphalt())
        //        classesScrollView.frame = CGRect(x: 0, y: 0, width: screenWidth - 56, height: 323)
        //        classesScrollView.center = classesView.center
        classesScrollView.contentSize = CGSize(width: CGFloat(screenWidth - (16 * 2) - (12 * 2)) * CGFloat(pages.count), height: classesScrollView.frame.height)

        for (index, page) in pages.enumerated() {
            page.frame = CGRect(x: classesScrollView.frame.width * CGFloat(index), y: 0, width: classesScrollView.frame.width, height: classesScrollView.frame.height)
            classesScrollView.addSubview(page)
            page.tag = index
        }
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = classesScrollView.contentOffset.x / classesScrollView.frame.size.width
        classesPageControl.progress = Double(page)
    }
}

extension FUIButton {
    var buttonId: Int { return self.tag }
    var parentId: Int { return self.superview!.tag }
}

// MARK: -
extension UIViewController {
    // MARK: SET BUTTON STYLE
    func setButtonStyle(
        button: FUIButton,
        buttonColor: MixedColor = MixedColor(normal: .turquoise(), night: .concrete()),
        shadowColor: MixedColor = MixedColor(normal: .greenSea(), night: .asbestos()),
        textColor:   MixedColor = MixedColor(normal: .clouds(), night: .clouds()),
        shadowHeight: CGFloat = 6.0,
        cornerRadius: CGFloat = 6.0,
        isDismiss: Bool = false) {

        button.shadowHeight = shadowHeight
        button.buttonColor  = buttonColor.unfold()
        button.shadowColor  = shadowColor.unfold()
        button.cornerRadius = isDismiss ? button.frame.height / 2 : cornerRadius

        button.setTitleColor(textColor.unfold(), for: .normal)
        button.setTitleColor(textColor.unfold(), for: .highlighted)
        button.backgroundColor = .clear

        button.isExclusiveTouch = true
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.adjustsFontSizeToFitWidth = true

        button.isHaptic = true
        button.hapticType = .impact(.light)
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
}
