import XCTest

final class SearchSavedPasswordsUITests: UITestCase {
    private var bottomNavBar: BottomNavigationBar { BottomNavigationBar(app: app) }
    private var safeScreen: SafeScreen { SafeScreen(app: app) }
    
    private let passwordTitle = "Search saved passwords"
    
    private func prepareApp() {
        addPassToSafe(withUsername: TEST_USER_EMAIL, andTitle: passwordTitle)
        bottomNavBar.tabSafeIcon()
    }
    
    override func tearDownWithError() throws {
        safeScreen.tapCancelButton()
        clearAllPasswords()
        
        super.tearDown()
    }

    func test_user_can_search_password_by_inputting_full_title() throws {
        prepareApp()
        safeScreen.searchForPassword(text: passwordTitle)
        
        XCTAssertTrue(safeScreen.isPasswordDisplayed(), "Password is not displayed in safe.")
        XCTAssertEqual(safeScreen.getTitleLabel(), passwordTitle, "Displayed password is not \(passwordTitle)")
    }

    func test_user_can_search_password_by_inputting_partial_title() throws {
        prepareApp()
        safeScreen.searchForPassword(text: "Search")
        
        XCTAssertTrue(safeScreen.isPasswordDisplayed(), "Password is not displayed in safe.")
        XCTAssertEqual(safeScreen.getTitleLabel(), passwordTitle, "Displayed password is not \(passwordTitle)")
    }

    func test_user_can_search_password_by_inputting_incorrect_title() throws {
        prepareApp()
        safeScreen.searchForPassword(text: "wrong input")
        
        XCTAssertFalse(safeScreen.isPasswordDisplayed(), "Password is displayed in safe.")
    }

}
