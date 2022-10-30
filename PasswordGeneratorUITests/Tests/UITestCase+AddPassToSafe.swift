import XCTest

extension UITestCase {
    func addPassToSafe(withUsername username: String, andTitle title: String) {
        let generatorScreen = GeneratorScreen(app: app)
        let savePasswordScreen = SavePasswordScreen(app: app)
        
        generatorScreen.pressAllTogglesOn()
        generatorScreen.tapAddToSafeButton()
        savePasswordScreen.fillAndSavePasswordForm(withUsername: username, andTitle: title)
    }
}
