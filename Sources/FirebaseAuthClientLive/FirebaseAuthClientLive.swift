//
//  FirebaseAuthClientLive.swift
//  FirebaseAuthClient
//
//  Created by Jose Miguel Benedicto Ruiz on 19/3/24.
//  Copyright © 2024 FirebaseAuthClient. All rights reserved.
//

import Foundation
import Dependencies
import FirebaseCore
import FirebaseAuth
import FirebaseAuthClient

extension FirebaseAuthClient: DependencyKey {
    public static var liveValue: Self {

        var configureClosure: @Sendable (String) throws -> Void = { filePath in
            
            guard let firebaseOptions = FirebaseOptions(contentsOfFile: filePath) else {
                throw FirebaseAuthError.bundleNotFound
            }
            
            if FirebaseApp.app() == nil {
                FirebaseApp.configure(options: firebaseOptions)
            } 
        }
        
        #if os(iOS)
        let canHandleURLClosure: @Sendable (URL) -> Bool = { url in
            Auth.auth().canHandle(url)
        }
        #endif
        
        var listenerClosure: @Sendable () -> AsyncStream<FirebaseListener> = {
            AsyncStream { continuation in
                let handler = Auth.auth().addStateDidChangeListener { auth, user in
                    continuation.yield(
                        FirebaseListener(
                            auth: FirebaseAuth(rawValue: auth),
                            user: user.map { FirebaseUser(rawValue: $0) }
                        )
                    )
                }
                continuation.onTermination = { _ in
                    Auth.auth().removeStateDidChangeListener(handler)
                }
            }
        }
        
        #if os(iOS)
        let getGitHubOAuthCredentialsClosure: @Sendable () async throws -> FirebaseOAuthCredential = {
            let githubProvider = OAuthProvider(providerID: "github.com")
            githubProvider.scopes = ["read:user", "user:email"]
            return try await withCheckedThrowingContinuation { [githubProvider] continuation in
                githubProvider.getCredentialWith(nil) {  credential, error in
                    if let error {
                        continuation.resume(throwing: error)
                    }
                    guard let credential else {
                        continuation.resume(throwing: FirebaseAuthError.noCredential)
                        return
                    }
                    
                    Auth.auth().signIn(with: credential) { authResult, error in
                        if let error {
                            continuation.resume(throwing: error)
                        }
                        
                        guard let oAuthCredential = authResult?.credential as? OAuthCredential else { return }
                        continuation.resume(returning: FirebaseOAuthCredential(rawValue: oAuthCredential))
                    }
                }
            }
        }
        #endif
        
        let logoutClosure: @Sendable () throws -> Void = {
            try Auth.auth().signOut()
        }
        
        #if os(iOS)
        return Self(
            configure: configureClosure,
            canHandleURL: canHandleURLClosure,
            listener: listenerClosure,
            getGitHubOAuthCredential: getGitHubOAuthCredentialsClosure,
            logout: logoutClosure)
        #else
        return Self(
            configure: configureClosure,
            listener: listenerClosure,
            logout: logoutClosure)
        #endif
        
    }
}
