import XCTest

extension UITestCase {
    func clearAllPasswords() {
        let bottomNavBar = BottomNavigationBar(app: app)
        let settingsScreen = SettingsScreen(app: app)
        
        bottomNavBar.tabSettingsIcon()
        settingsScreen.tapClearPasswords()
        settingsScreen.tapDeleteAll()
    }
}
