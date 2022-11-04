import XCTest

final class GeneratorScreen: BaseScreen {
    private var specialCharactersToggle: XCUIElement { app.switches["special-characters-toggle"]}
    private var uppercaseToggle: XCUIElement { app.switches["uppercase-toggle"] }
    private var figuresToggle: XCUIElement { app.switches["figures-toggle"] }
    private var passwordCharacters: [XCUIElement] { app.staticTexts.matching(identifier: "password-character").allElementsBoundByIndex }
    private var addToSafeButton: XCUIElement { app.buttons["add-to-safe-button"] }
    private var characterSlider: XCUIElement { app.sliders["character-slider"] }
    private var copyButton: XCUIElement { app.buttons["copy-button"] }
    private var successIcon: XCUIElement { app.staticTexts["success-message"] }
    
    func pressSpecialCharactersToggleOn() {
        specialCharactersToggle.turnToggleON()
    }
    
    func pressSpecialCharactersToggleOff() {
        specialCharactersToggle.turnToggleOFF()
    }
    
    func pressUppercaseToggleOn() {
        uppercaseToggle.turnToggleON()
    }
    
    func pressUppercaseToggleOff() {
        uppercaseToggle.turnToggleOFF()
    }
    
    func pressFiguresToggleOn() {
        figuresToggle.turnToggleON()
    }
    
    func pressFiguresToggleOff() {
        figuresToggle.turnToggleOFF()
    }
    
    func pressAllTogglesOn() {
        pressSpecialCharactersToggleOn()
        pressUppercaseToggleOn()
        pressFiguresToggleOn()
    }
    
    func getPassword() -> String {
        var password: String = ""
        
        for character in passwordCharacters {
            password += character.label
        }
        
        return password
    }
    
    func tapAddToSafeButton() {
        addToSafeButton.waitAndTap()
    }
    
    func setCharacterSlider(_ charactersNumber: CGFloat) {
        characterSlider.adjustSlider(to: charactersNumber)
    }
    
    func tapCopyButton() {
        copyButton.waitAndTap()
    }
    
    func isSuccessPresent() -> Bool {
        successIcon.isDisplayed()
    }
}
