import XCTest

final class BottomNavigationBar: BaseScreen {
    private var generatorIcon: XCUIElement { app.tabBars.buttons.element(boundBy: 0) }
    private var safeIcon: XCUIElement { app.tabBars.buttons.element(boundBy: 1) }
    private var settingsIcon: XCUIElement { app.tabBars.buttons.element(boundBy: 2) }
    
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
