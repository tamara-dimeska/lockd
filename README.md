# lockd 

<img src="https://user-images.githubusercontent.com/61360545/139026632-b8075cd1-f33f-4532-8842-590c98db45f8.png" alt="lockd" width="100" height="100"/>

Password manager app for iOS, generate strong passwords and save them!  

<img src="https://user-images.githubusercontent.com/61360545/139028428-9a284105-72d9-44e4-be21-8e92816399de.gif" alt="lockd" width="300" height="600"/>



Download lockd on the App Store: https://apps.apple.com/us/app/lockd/id1571284259

**Features:**  

- Generate strong custom passwords  
- Save passwords
- Visualize password strengh (entropy, combinations, lenght)
- Lock app with FaceID, TouchID & iPhone passcode
- Haptic feedbacks
- Privacy mode (hides content in app switcher)
- Popup animations
- Search for passwords  
- Sort by alphabetical order or reverse alphabet    
- Copy passwords & usernames to clipboard  
- Light & dark mode
- Clear all passwords at once
- Support english & French languages

**Dependencies, Libraries:**  

lockd is built with: 

- KeychainSwift (https://github.com/evgenyneu/keychain-swift)  
KeychainSwift is used to save passwords simply and securely

- SwiftUIX (https://github.com/SwiftUIX/SwiftUIX)  
SwiftUIX is used in the app for some components like search bar (for devices -iOS 15), text fields and keyboard 

- PopupView (https://github.com/exyte/PopupView)  
PopupView is simply used for confirmation popups 

## UI Tests

The UI tests follow the Page Object Model (POM) architecture. Each screen is represented with one page (screen) object class, which contains all elements on that screen and any methods that are used for interacting with those elements. Each page obejcts inherits from the `BaseScreen`, where we initialize the `XCUIApplication`. All the page objects can be found in the `Screens` folder.

The tests are all saved in the `Tests` folder. They all are inheriting the `UITestCase` class, which contains a shared `setUp()` for all of them. 

In the `Framework` fodler we have some extensions to classes like `XCUIElement`, `String`, etc. that are used in the page obejcts and the tests. 

Lastly we have the `Data` folder that contains files with some shared constants and datasets.

**How to run the tests?**
The tests can be executed individually or in parallel. They are all independent from each other, so the order in which they are executed doesn't matter.
You can run the tests from the XCode UI or the command line. 
If you want to run through the XCode UI then you can go to the Test Navigator and select the tests you'd like to run.
If you want to run them through the command line, then run the following code:
`lockd % xcodebuild test -project PasswordGenerator.xcodeproj -scheme PasswordGeneratorUITests -destination 'platform=iOS Simulator,name=iPhone 14 Pro'`
Note: In order for the command to work you need to be in the `./lockd` folder and that you might need to change the simulator name, based on the config that you have.
For more details how to run the tests via command line, on a device, or just certain suites/tests, refer to [this article](https://medium.com/tauk-blog/running-xctests-from-the-command-line-f2e5ce0b4bfd).
