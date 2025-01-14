import XCTest

extension XCUIElement {
    func waitAndTap() {
        waitForExistance()
        tap()
    }
    
    func waitAndGetValue() -> String {
        waitForExistance()
        
        guard let value = value as? String else { return "" }
        return value
    }
    
    func adjustSlider(to position: CGFloat) {
        adjust(toNormalizedSliderPosition: position)
    }
    
    func enterText(text: String) {
        typeText(text)
    }
    
    func clearText() {
        guard let stringValue = value as? String else {
            return
        }
        var stringLength = stringValue.count
        
        while (stringLength != 0) {
            XCUIApplication().keys["delete"].tap()
            stringLength -= 1
        }
    }
    
    func waitForExistance() {
        waitFor(predicate: "exists == true")
    }
    
    func turnToggleON() {
        if waitAndGetValue() == "0" {
            tap()
        }
    }
    
    func turnToggleOFF() {
        if waitAndGetValue() == "1" {
            tap()
        }
    }
    
    func isDisplayed() -> Bool {
        if waitForExistence(timeout: TIMEOUT_INTERVAL) {
            return true
        } else {
            return false
        }
    }
    
    // Reference from: https://alexilyenko.github.io/xcuitest-waiting/
    private func waitFor(predicate: String, timeout: TimeInterval = TIMEOUT_INTERVAL) {
        let predicate = NSPredicate(format: predicate)
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: self)
        _ = XCTWaiter.wait(for: [expectation], timeout: timeout)
    }
}
