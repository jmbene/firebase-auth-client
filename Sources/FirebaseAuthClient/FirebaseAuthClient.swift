//
//  FirebaseAuthClient.swift
//  FirebaseAuthClient
//
//  Created by Jose Miguel Benedicto Ruiz on 19/3/24.
//  Copyright © 2024 FirebaseAuthClient. All rights reserved.
//

import Foundation
import Dependencies

#if os(iOS)
public struct FirebaseAuthClient {
    public var configure: @Sendable (_ path: String) throws -> Void
    public var canHandleURL: @Sendable (_ url: URL) -> Bool = { _ in true }
    public var listener: @Sendable () -> AsyncStream<FirebaseListener> = { AsyncStream { FirebaseListener.loggedOut } }
    public var getGitHubOAuthCredential: @Sendable () async throws -> FirebaseOAuthCredential
    public var logout: @Sendable () throws -> Void
    
    public init(
        configure: @Sendable @escaping (_ path: String) throws -> Void,
        canHandleURL: @Sendable @escaping (_ url: URL) -> Bool,
        listener: @Sendable @escaping () -> AsyncStream<FirebaseListener>,
        getGitHubOAuthCredential: @Sendable @escaping () async throws -> FirebaseOAuthCredential,
        logout: @Sendable @escaping () throws -> Void
    ) {
        self.configure = configure
        self.canHandleURL = canHandleURL
        self.listener = listener
        self.getGitHubOAuthCredential = getGitHubOAuthCredential
        self.logout = logout
    }
}
#else
public struct FirebaseAuthClient {
    public var configure: @Sendable (_ path: String) throws -> Void
    public var listener: @Sendable () -> AsyncStream<FirebaseListener> = { AsyncStream { FirebaseListener.loggedOut } }
    public var logout: @Sendable () throws -> Void
    
    public init(
        configure: @Sendable @escaping (_ path: String) throws -> Void,
        listener: @Sendable @escaping () -> AsyncStream<FirebaseListener>,
        logout: @Sendable @escaping () throws -> Void
    ) {
        self.configure = configure
        self.listener = listener
        self.logout = logout
    }
}
#endif

extension DependencyValues {
    public var authClient: FirebaseAuthClient {
        get { self[FirebaseAuthClient.self] }
        set { self[FirebaseAuthClient.self] = newValue }
    }
}
