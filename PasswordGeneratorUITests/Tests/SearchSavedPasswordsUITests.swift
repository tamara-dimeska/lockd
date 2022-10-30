import XCTest

final class SearchSavedPasswords: UITestCase {
    private var settingsScreen: SettingsScreen { SettingsScreen(app: app) }
    
    private func prepareApp() {
        addPassToSafe(withUsername: TEST_USER_EMAIL, andTitle: "Search saved passwords")
    }
    
    override func tearDownWithError() throws {
        clearAllPasswords()
        
        super.tearDown()
    }

    func test_user_can_search_password_by_inputting_full_title() throws {

    }

    func test_user_can_search_password_by_inputting_partial_title() throws {

    }

    func test_user_can_search_password_by_inputting_incorrect_title() throws {

    }

}
