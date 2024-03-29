//
//  FirebaseAuthClient+Testing.swift
//  FirebaseAuthClient
//
//  Created by Jose Miguel Benedicto Ruiz on 19/3/24.
//  Copyright © 2024 FirebaseAuthClient. All rights reserved.
//

import Foundation
import Dependencies
import XCTestDynamicOverlay

extension FirebaseAuthClient: TestDependencyKey {
    
    internal struct Testing {
        #if os(iOS)
        static let getGitHubOAuthCredentialClosure: @Sendable () async throws -> FirebaseOAuthCredential = {
            FirebaseOAuthCredential(
                idToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c",
                accessToken: "deadbeef-dead-beef-dead-beefdeadbeef",
                secret: "Secret")
        }
        #endif
    }
    
    
    
    public static var loginAlwaysFails: Self {
        
        #if os(iOS)
        let getGitHubOAuthCredentialClosure: @Sendable () async throws -> FirebaseOAuthCredential = {
            throw FirebaseAuthError.noCredential
        }
        #endif
        
        var listenerClosure: @Sendable () -> AsyncStream<FirebaseListener> = {
            AsyncStream {
                FirebaseListener.loggedOut
            }
        }
        
        #if os(iOS)
        return Self(
            configure: { _ in },
            canHandleURL: { _ in true },
            listener: listenerClosure,
            getGitHubOAuthCredential: getGitHubOAuthCredentialClosure,
            logout: { })
        #else
        return Self(
            configure: { _ in },
            listener: listenerClosure,
            logout: { })
        #endif
    }
    
    public static var switchLoggedOutToLoggedIn: Self {
        
        let listenerClosure: @Sendable () -> AsyncStream<FirebaseListener> = {
            AsyncStream { continuation in
                Task {
                    var times = 0
                    while true {
                        if times % 2 == 0 {
                            continuation.yield(FirebaseListener.loggedOut)
                        } else {
                            continuation.yield(FirebaseListener.loggedIn)
                        }
                        try? await Task.sleep(nanoseconds: NSEC_PER_SEC * 10)
                        times += 1
                    }
                }
                
            }
        }
        
        #if os(iOS)
        return Self(
            configure: { _ in },
            canHandleURL: { _ in true },
            listener: listenerClosure,
            getGitHubOAuthCredential: FirebaseAuthClient.Testing.getGitHubOAuthCredentialClosure,
            logout: { })
        #else
        return Self(
            configure: { _ in },
            listener: listenerClosure,
            logout: { })
        #endif
    }
    
    public static var alwaysLoggedIn: Self {
        
        var listenerClosure: @Sendable () -> AsyncStream<FirebaseListener> = {
            AsyncStream {
                FirebaseListener.loggedIn
            }
        }
        
        #if os(iOS)
        return Self(
            configure: { _ in },
            canHandleURL: { _ in true },
            listener: listenerClosure,
            getGitHubOAuthCredential: FirebaseAuthClient.Testing.getGitHubOAuthCredentialClosure,
            logout: { })
        #else
        return Self(
            configure: { _ in },
            listener: listenerClosure,
            logout: { })
        #endif
    }
    
    public static var alwaysLoggedOut: Self {
        
        var listenerClosure: @Sendable () -> AsyncStream<FirebaseListener> = {
            AsyncStream {
                FirebaseListener.loggedOut
            }
        }
        
        #if os(iOS)
        return Self(
            configure: { _ in },
            canHandleURL: { _ in true },
            listener: listenerClosure,
            getGitHubOAuthCredential: FirebaseAuthClient.Testing.getGitHubOAuthCredentialClosure,
            logout: { })
        #else
        return Self(
            configure: { _ in },
            listener: listenerClosure,
            logout: { })
        #endif
    }
    
    public static let previewValue = FirebaseAuthClient.switchLoggedOutToLoggedIn
    
    public static var testValue: Self {
        #if os(iOS)
        Self(
            configure: { _ in unimplemented("\(Self.self).configure") },
            canHandleURL: { _ in unimplemented("\(Self.self).canHandleURL") },
            listener: { unimplemented("\(Self.self).listener") },
            getGitHubOAuthCredential: { unimplemented("\(Self.self).getGitHubOAuthCredential") },
            logout: { unimplemented("\(Self.self).logout") }
        )
        #else
        Self(
            configure: { _ in unimplemented("\(Self.self).configure") },
            listener: { unimplemented("\(Self.self).listener") },
            logout: { unimplemented("\(Self.self).logout") }
        )
        #endif
    }
        
}
