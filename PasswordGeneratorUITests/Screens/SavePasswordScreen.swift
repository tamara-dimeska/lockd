import XCTest

final class SavePasswordScreen: BaseScreen {
    private var usernameField: XCUIElement { app.textFields["username-input"] }
    private var titleField: XCUIElement { app.textFields["title-input"] }
    private var savePasswordButton: XCUIElement { app.buttons["save-pass-button"] }
    private var successIcon: XCUIElement { app.staticTexts["success-message"] }
    private var passwordField: XCUIElement { app.textFields["password-field"] }
    private var checkmarkIcon: XCUIElement { app.buttons["checkmark-icon"] }
    
    func inputUsername(_ username: String) {
        usernameField.waitAndTap()
        usernameField.typeText(username)
        usernameField.typeText("\n") // close keyboard
    }
    
    func inputTitle(_ title: String) {
        titleField.waitAndTap()
        titleField.typeText(title)
        titleField.typeText("\n") // close keyboard
    }
    
    func tapSavePassword() {
        savePasswordButton.waitAndTap()
    }
    
    func isSuccessPresent() -> Bool {
        successIcon.isDisplayed()
    }
    
    func inputPassword(_ password: String) {
        passwordField.waitAndTap()
        passwordField.typeText(password)
        passwordField.typeText("\n") // close keyboard
    }
    
    func tapCheckmarkIcon() {
        checkmarkIcon.waitAndTap()
    }
    
    func fillAndSavePasswordForm(withUsername username: String, andTitle title: String) {
        inputUsername(username)
        inputTitle(title)
        tapSavePassword()
    }
}
