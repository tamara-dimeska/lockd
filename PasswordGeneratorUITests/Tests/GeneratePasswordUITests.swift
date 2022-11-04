import XCTest

final class GeneratePasswordUITests: UITestCase {
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
    
    func test_password_can_be_saved_with_all_characters_included() throws {
        let passwordTitle = "Generate and Save pass with all characters"
        
        generatorScreen.pressAllTogglesOn()
        generatorScreen.tapAddToSafeButton()
        savePasswordScreen.fillAndSavePasswordForm(withUsername: TEST_USER_EMAIL, andTitle: passwordTitle)
            
        XCTAssertTrue(savePasswordScreen.isSuccessPresent(), "Password is not successfully saved.")
        
        bottomNavBar.tabSafeIcon()
        XCTAssertTrue(safeScreen.isPasswordDisplayed(), "Password is not displayed in safe.")
        XCTAssertEqual(safeScreen.getTitleLabel(), passwordTitle, "Displayed password is not \(passwordTitle)")
    }
    
    func test_password_can_be_saved_without_special_characters() throws {
        let passwordTitle = "Generate and Save pass without special charactes"
        
        generatorScreen.pressSpecialCharactersToggleOff()
        generatorScreen.pressUppercaseToggleOn()
        generatorScreen.pressFiguresToggleOn()
        generatorScreen.tapAddToSafeButton()
        savePasswordScreen.fillAndSavePasswordForm(withUsername: TEST_USER_EMAIL, andTitle: passwordTitle)
        
        XCTAssertTrue(savePasswordScreen.isSuccessPresent(), "Password is not successfully saved.")
        
        bottomNavBar.tabSafeIcon()
        XCTAssertTrue(safeScreen.isPasswordDisplayed(), "Password is not displayed in safe.")
        XCTAssertEqual(safeScreen.getTitleLabel(), passwordTitle, "Displayed password is not \(passwordTitle)")
    }
    
    func test_password_can_be_saved_without_uppercase_letters() throws {
        let passwordTitle = "Generate and Save pass without uppercase letters"
        
        generatorScreen.pressSpecialCharactersToggleOn()
        generatorScreen.pressUppercaseToggleOff()
        generatorScreen.pressFiguresToggleOn()
        generatorScreen.tapAddToSafeButton()
        savePasswordScreen.fillAndSavePasswordForm(withUsername: TEST_USER_EMAIL, andTitle: passwordTitle)
   
        XCTAssertTrue(savePasswordScreen.isSuccessPresent(), "Password is not successfully saved.")
        
        bottomNavBar.tabSafeIcon()
        XCTAssertTrue(safeScreen.isPasswordDisplayed(), "Password is not displayed in safe.")
        XCTAssertEqual(safeScreen.getTitleLabel(), passwordTitle, "Displayed password is not \(passwordTitle)")
    }
    
    func test_password_can_be_saved_without_numbers() throws {
        let passwordTitle = "Generate and Save pass without numbers"
        
        generatorScreen.pressSpecialCharactersToggleOn()
        generatorScreen.pressUppercaseToggleOn()
        generatorScreen.pressFiguresToggleOff()
        generatorScreen.tapAddToSafeButton()
        savePasswordScreen.fillAndSavePasswordForm(withUsername: TEST_USER_EMAIL, andTitle: passwordTitle)

        XCTAssertTrue(savePasswordScreen.isSuccessPresent(), "Password is not successfully saved.")
        
        bottomNavBar.tabSafeIcon()
        XCTAssertTrue(safeScreen.isPasswordDisplayed(), "Password is not displayed in safe.")
        XCTAssertEqual(safeScreen.getTitleLabel(), passwordTitle, "Displayed password is not \(passwordTitle)")
    }
    
    func test_password_with_different_strength_level_can_be_saved() throws {
        for passwordStrength in [0.0, 0.16, 0.26, 0.5, 1] {
            let passwordTitle = "Generate and Save password, strength value \(passwordStrength)"
            
            bottomNavBar.tapGeneratorIcon()
            generatorScreen.setCharacterSlider(passwordStrength)
            generatorScreen.pressAllTogglesOn()
            generatorScreen.tapAddToSafeButton()
            savePasswordScreen.fillAndSavePasswordForm(withUsername: TEST_USER_EMAIL, andTitle: passwordTitle)

            XCTAssertTrue(savePasswordScreen.isSuccessPresent(), "Password is not successfully saved, when strength value is \(passwordStrength).")
            
            bottomNavBar.tabSafeIcon()
            XCTAssertTrue(safeScreen.isPasswordDisplayed(), "Password is not displayed in safe, when strength value is \(passwordStrength).")
            XCTAssertEqual(safeScreen.getTitleLabel(), passwordTitle, "Displayed password is not \(passwordTitle)")
            
            clearAllPasswords()
        }
    }
    
    func test_generated_password_can_be_copied() throws {
        generatorScreen.pressAllTogglesOn()
        generatorScreen.tapCopyButton()
        
        XCTAssertTrue(generatorScreen.isSuccessPresent(), "Password is not copied.")
    }
}
