import XCTest

final class AddPasswordUITests: UITestCase {
    private var viewPasswordScreen: ViewPasswordScreen { ViewPasswordScreen(app: app) }
    private var settingsScreen: SettingsScreen { SettingsScreen(app: app) }
    private var bottomNavBar: BottomNavigationBar { BottomNavigationBar(app: app) }
    private var safeScreen: SafeScreen { SafeScreen(app: app) }
    private var savePasswordScreen: SavePasswordScreen { SavePasswordScreen(app: app) }
    
    override func tearDownWithError() throws {
        clearAllPasswords()
        
        super.tearDown()
    }
    
    func test_password_can_be_saved_from_safe() throws {
        bottomNavBar.tabSafeIcon()
        safeScreen.tapAddNewPassword()
        savePasswordScreen.inputPassword("newPassword123#$%")
        savePasswordScreen.tapCheckmarkIcon()
        savePasswordScreen.fillAndSavePasswordForm(withUsername: TEST_USER_EMAIL, andTitle: "Add New Password from Safe")

        XCTAssertTrue(safeScreen.isPasswordDisplayed(), "Password is not saved and is not displayed on safe screen.")
    }
}
