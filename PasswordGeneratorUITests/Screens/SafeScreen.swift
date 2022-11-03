import XCTest

final class SafeScreen: BaseScreen {
    private var addNewPasswordButton: XCUIElement { app.buttons["add-new-password"] }
    private var openPasswordButton: XCUIElement { app.buttons["saved-password-item"] }
    private var searchBar: XCUIElement { app.searchFields["Search"] }
    private var cancelButton: XCUIElement { app.buttons["Cancel"] }
    
    func tapAddNewPassword() {
        addNewPasswordButton.waitAndTap()
    }
    
    func isPasswordDisplayed() -> Bool {
        openPasswordButton.isDisplayed()
    }
    
    func openPassword() {
        openPasswordButton.waitAndTap()
    }
    
    func searchForPassword(text: String) {
        searchBar.waitAndTap()
        searchBar.enterText(text: text)
    }
    
    func tapCancelButton() {
        cancelButton.waitAndTap()
    }
}
