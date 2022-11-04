import XCTest

final class ClearAllPasswordsUITests: UITestCase {
    private var settingsScreen: SettingsScreen { SettingsScreen(app: app) }
    private var bottomNavBar: BottomNavigationBar { BottomNavigationBar(app: app) }
    private var safeScreen: SafeScreen { SafeScreen(app: app) }
    
    private func prepareApp() {
        addPassToSafe(withUsername: TEST_USER_EMAIL, andTitle: "Test Clear all Passwords")
    }

    func test_all_passwords_can_be_deleted() throws {
        prepareApp()
        clearAllPasswords()
        bottomNavBar.tabSafeIcon()
        
        XCTAssertFalse(safeScreen.isPasswordDisplayed(), "Password is still displayed in safe.")
    }

}
