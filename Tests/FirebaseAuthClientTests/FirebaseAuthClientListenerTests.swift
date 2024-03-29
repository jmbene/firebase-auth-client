//
//  FirebaseAuthClientListenerTests.swift
//
//
//  Created by Jose Miguel Benedicto Ruiz on 27/3/24.
//

import XCTest
@testable import FirebaseAuthClient
@testable import FirebaseAuthClientLive
import Dependencies

final class FirebaseAuthClientListenerTests: XCTestCase {

    @Dependency(\.authClient) var authClient
    var path: String!
    
    override func setUp() {
        super.setUp()
        
        path = Bundle.module.path(forResource: "GoogleService-Info", ofType: "plist")
        XCTAssertNotNil(path, "You did not add your Firebase project file GoogleService-Info.plist to the Resources folder in the target FirebaseAuthClientTests")
    }

    func testListener() async {
        try! await withDependencies { dependencies in
            dependencies.authClient = .liveValue
        } operation: {
            let task = Task { [authClient, path] in
                try authClient.configure(path!)
                for await status in authClient.listener() {
                    XCTAssertNotNil(status.auth, "Values from Firebase are not received")
                }
            }
            try await Task.sleep(nanoseconds: NSEC_PER_SEC) // wait for some time for the listener to be executed when started
            task.cancel()
        }
    }
}
