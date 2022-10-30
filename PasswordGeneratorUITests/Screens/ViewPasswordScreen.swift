import XCTest

final class ViewPasswordScreen: BaseScreen {
    // username related elements
    private var usernameText: XCUIElement { app.staticTexts["username-text"] }
    private var copyUsernameButton: XCUIElement { app.buttons["view-pass-copy-username-button"] }
    private var editUsernameButton: XCUIElement { app.buttons["view-pass-edit-username-button"] }
    private var editedUsernameText: XCUIElement { app.textFields["edited-username-text"] }
    private var saveEditedUsernameButton: XCUIElement { app.buttons["view-pass-save-edit-username-button"] }

    // password related elements
    private var passwordText: XCUIElement { app.staticTexts["password-text"] }
    private var copyPasswordButton: XCUIElement { app.buttons["view-pass-copy-pass-button"] }
    private var editPasswordButton: XCUIElement { app.buttons["view-pass-edit-password-button"] }
    private var editedPasswordText: XCUIElement { app.textFields["edited-password-text"] }
    private var saveEditedPasswordButton: XCUIElement { app.buttons["view-pass-save-edit-password-button"] }

    // other elements
    private var showHideButton: XCUIElement { app.buttons["show-hide-button"] }
    private var closeButton: XCUIElement { app.buttons["view-pass-close-button"] }
    private var successIcon: XCUIElement { app.staticTexts["success-message"] }
    private var deletePasswordButton: XCUIElement { app.buttons["view-pass-delete-pass-button"] }
    private var deleteButton: XCUIElement { app.buttons["Delete"] }
        
    func tapShowPasswordButton() {
        showHideButton.waitAndTap()
    }

    func getPassword() -> String {
        passwordText.label
    }

    func copyPassword() {
        copyPasswordButton.waitAndTap()
    }

    func isSuccessPresent() -> Bool {
        successIcon.isDisplayed()
    }

    func editPassword(_ newPass: String) {
        editPasswordButton.waitAndTap()
        editedPasswordText.typeText(newPass)
        saveEditedPasswordButton.tap()
    }

    func editUsername(_ newUsername: String) {
       editUsernameButton.waitAndTap()
       editedUsernameText.typeText(newUsername)
       saveEditedUsernameButton.tap()
    }

    func getUsername() -> String {
       usernameText.label
    }

    func copyUsername() {
       copyUsernameButton.waitAndTap()
    }

    func deletePassword() {
       deletePasswordButton.waitAndTap()
       deleteButton.waitAndTap()
    }
}
