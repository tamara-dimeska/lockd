import XCTest

final class OnboardingScreen: BaseScreen {
    private var continueButton: XCUIElement { app.buttons["continue-button"] }
    
    func closeOnboardingScreenIfOn() {
        if continueButton.waitForExistence(timeout: 3) {
            continueButton.tap()
        }
    }
}
