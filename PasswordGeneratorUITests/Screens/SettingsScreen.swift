import XCTest

final class SettingsScreen: BaseScreen {
    private var clearPasswordsButton: XCUIElement { app.buttons["clear-passwords"] }
    private var deleteAllButton: XCUIElement { app.alerts.buttons["Delete ALL"] }
    
    func tapClearPasswords() {
        clearPasswordsButton.waitAndTap()
    }
    
    func tapDeleteAll() {
        deleteAllButton.waitAndTap()
    }
}
