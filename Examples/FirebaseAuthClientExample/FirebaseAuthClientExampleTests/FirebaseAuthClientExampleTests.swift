//
//  FirebaseAuthClientExampleTests.swift
//  FirebaseAuthClientExampleTests
//
//  Created by Jose Miguel Benedicto Ruiz on 28/3/24.
//

import XCTest
import Dependencies
@testable import FirebaseAuthClientExample

final class FirebaseAuthClientExampleTests: XCTestCase {
    
    @MainActor
    func testLoginOK() async throws {
        let viewModel = withDependencies { dependencies in
            dependencies.authClient = .alwaysLoggedIn
        } operation: {
            ContentViewModel()
        }
        
        await viewModel.login()
        XCTAssertEqual(viewModel.accessToken, "deadbeef-dead-beef-dead-beefdeadbeef", "Access token does not exist after a login operation")
    }
    
    @MainActor
    func testLoginFailed() async throws {
        let viewModel = withDependencies { dependencies in
            dependencies.authClient = .loginAlwaysFails
        } operation: {
            ContentViewModel()
        }
        
        await viewModel.login()
        XCTAssertNil(viewModel.accessToken, "Access token does not exist after a login operation")
    }
    
    @MainActor
    func testLogout() async throws {
        let viewModel = withDependencies { dependencies in
            dependencies.authClient = .alwaysLoggedOut
        } operation: {
            ContentViewModel()
        }
   
        await viewModel.logout()
        XCTAssertNil(viewModel.accessToken, "Access token exists after a logout")
    }
    
    @MainActor
    func testCanOpenURL() async throws {
        let viewModel = withDependencies { dependencies in
            dependencies.authClient = .alwaysLoggedOut
        } operation: {
            ContentViewModel()
        }
   
        let canOpenURL = viewModel.canOpenURL(URL(string: "https://www.google.com")!)
        XCTAssertTrue(canOpenURL, "App can open URL")
    }

}
