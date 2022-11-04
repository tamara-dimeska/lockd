import XCTest

final class BottomNavigationBar: BaseScreen {
    private var generatorIcon: XCUIElement { app.buttons["Generator"] }
    private var safeIcon: XCUIElement { app.buttons["Safe"] }
    private var settingsIcon: XCUIElement { app.buttons["Settings"] }
    
    func tapGeneratorIcon() {
        generatorIcon.waitAndTap()
    }
    
    func tabSafeIcon() {
        safeIcon.waitAndTap()
    }
    
    func tabSettingsIcon() {
        settingsIcon.waitAndTap()
    }
}
