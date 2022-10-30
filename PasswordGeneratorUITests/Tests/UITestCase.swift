import XCTest

class UITestCase: XCTestCase {
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
        
        OnboardingScreen(app: app).closeOnboardingScreenIfOn()
    }
}
