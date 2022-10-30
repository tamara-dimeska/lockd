import XCTest

final class SafeScreen: BaseScreen {
    private var addNewPasswordButton: XCUIElement { app.buttons["add-new-password"] }
    private var openPasswordButton: XCUIElement { app.buttons["saved-password-item"] }
    
    func tabAddNewPassword() {
        addNewPasswordButton.waitAndTap()
    }
    
    func isPasswordDisplayed() -> Bool {
        openPasswordButton.isDisplayed()
    }
    
    func openPassword() {
        openPasswordButton.waitAndTap()
    }
}
