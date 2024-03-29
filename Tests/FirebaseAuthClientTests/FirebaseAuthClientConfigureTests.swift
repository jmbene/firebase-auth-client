import XCTest
@testable import FirebaseAuthClient
@testable import FirebaseAuthClientLive
import FirebaseCore
import Dependencies

final class FirebaseAuthClientConfigureTests: XCTestCase {
    
    @Dependency(\.authClient) var authClient
    var path: String!
    
    override func setUp() {
        super.setUp()
        
        path = Bundle.module.path(forResource: "GoogleService-Info", ofType: "plist")
        XCTAssertNotNil(path, "You did not add your Firebase project file GoogleService-Info.plist to the Resources folder in the target FirebaseAuthClientTests")
    }

    func testConfigureValidPath() {
        try! withDependencies { dependencies in
            dependencies.authClient = .liveValue
        } operation: {
            XCTAssertNoThrow(try authClient.configure(path), "Bundle was not found when trying to configure")
            XCTAssertNotNil(FirebaseApp.app(), "Firebase was not initialized after calling configure")
        }
    }
    
    func testConfigureInvalidPath() {
        try! withDependencies { dependencies in
            dependencies.authClient = .liveValue
        } operation: {
            path = ""
            XCTAssertThrowsError(try authClient.configure(path), "Bundle was not found when trying to configure") { error in
                XCTAssertEqual(error as? FirebaseAuthError, .bundleNotFound)
            }
        }
    }
}
