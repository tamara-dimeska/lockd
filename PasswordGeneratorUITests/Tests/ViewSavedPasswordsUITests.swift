import XCTest

final class ViewSavedPasswords: UITestCase {
    private var viewPasswordScreen: ViewPasswordScreen { ViewPasswordScreen(app: app) }
    private var settingsScreen: SettingsScreen { SettingsScreen(app: app) }
    private var generatorScreen: GeneratorScreen { GeneratorScreen(app: app) }
    private var savePasswordScreen: SavePasswordScreen { SavePasswordScreen(app: app) }
    private var bottomNavBar: BottomNavigationBar { BottomNavigationBar(app: app) }
    private var safeScreen: SafeScreen { SafeScreen(app: app) }
    
    override func tearDownWithError() throws {
        clearAllPasswords()
        
        super.tearDown()
    }

    func test_user_can_see_saved_password_in_safe() throws {
        generatorScreen.pressAllTogglesOn()
            
        let passwordOnGeneratorPage = generatorScreen.getPassword()
        
        generatorScreen.tapAddToSafeButton()
        savePasswordScreen.fillAndSavePasswordForm(withUsername: TEST_USER_EMAIL, andTitle: "View saved password")
        bottomNavBar.tabSafeIcon()
        safeScreen.openPassword()
        viewPasswordScreen.tapShowPasswordButton()
        
        let passwordInSafe = viewPasswordScreen.getPassword()
        
        XCTAssertEqual(passwordOnGeneratorPage, passwordInSafe, "Password on generator screen is different from the one in safe.")
    }
    
    func test_user_can_copy_saved_password_in_safe() throws {
        addPassToSafe(withUsername: TEST_USER_EMAIL, andTitle: "Copy saved password")
        bottomNavBar.tabSafeIcon()
        safeScreen.openPassword()
        viewPasswordScreen.tapShowPasswordButton()
        viewPasswordScreen.copyPassword()

        XCTAssertTrue(viewPasswordScreen.isSuccessPresent(), "Password is not successfully copied.")
    }

    func test_user_can_edit_saved_password_in_safe() throws {
        generatorScreen.pressAllTogglesOn()

        let passwordOnGeneratorPage = generatorScreen.getPassword()

        generatorScreen.tapAddToSafeButton()
        savePasswordScreen.fillAndSavePasswordForm(withUsername: TEST_USER_EMAIL, andTitle: "Edit saved password")
        bottomNavBar.tabSafeIcon()
        safeScreen.openPassword()
        viewPasswordScreen.tapShowPasswordButton()
        viewPasswordScreen.editPassword("NEW")
            
        let passwordInSafe = viewPasswordScreen.getPassword()

        XCTAssertEqual(passwordOnGeneratorPage + "NEW", passwordInSafe, "Edited password is not saved in safe.")
    }

    func test_user_can_edit_saved_password_username_in_safe() throws {
        addPassToSafe(withUsername: TEST_USER_EMAIL, andTitle: "Edit username in saved password")
        bottomNavBar.tabSafeIcon()
        safeScreen.openPassword()
        viewPasswordScreen.editUsername("NEW")
        
        let usernameInSafe = viewPasswordScreen.getUsername()

        XCTAssertEqual(TEST_USER_EMAIL + "NEW", usernameInSafe, "Edited username is not saved in safe.")
    }

    func test_user_can_copy_username_in_safe() throws {
        addPassToSafe(withUsername: "test@example.com", andTitle: "Copy username in saved password")
        bottomNavBar.tabSafeIcon()
        safeScreen.openPassword()
        viewPasswordScreen.copyUsername()

        XCTAssertTrue(viewPasswordScreen.isSuccessPresent(), "Username is not copied successfully.")
    }

    func test_user_can_delete_saved_password_in_safe() throws {
        addPassToSafe(withUsername: TEST_USER_EMAIL, andTitle: "Delete saved password")
        bottomNavBar.tabSafeIcon()
        safeScreen.openPassword()
        viewPasswordScreen.deletePassword()

        XCTAssertFalse(safeScreen.isPasswordDisplayed(), "Password is not successfully deleted.")
    }
}
