//
//  FirebaseAuth+Testing.swift
//  FirebaseAuthClient
//
//  Created by Jose Miguel Benedicto Ruiz on 19/3/24.
//  Copyright © 2024 FirebaseAuthClient. All rights reserved.
//

import Foundation

extension FirebaseAuth {
    #if os(iOS)
    public static let loggedIn = Self(
        app: FirebaseAuthApp.mock,
        currentUser: FirebaseUser.mock,
        settings: FirebaseAuthSettings.mock,
        shareAuthStateAcrossDevices: false)
    #else
    public static let loggedIn = Self(
        app: FirebaseAuthApp.mock,
        currentUser: FirebaseUser.mock,
        settings: FirebaseAuthSettings.mock,
        shareAuthStateAcrossDevices: false)
    #endif
    
    #if os(iOS)
    public static let loggedOut = Self(
        app: FirebaseAuthApp.mock,
        currentUser: nil,
        settings: FirebaseAuthSettings.mock,
        shareAuthStateAcrossDevices: false)
    #else
    public static let loggedOut = Self(
        app: FirebaseAuthApp.mock,
        currentUser: nil,
        settings: FirebaseAuthSettings.mock,
        shareAuthStateAcrossDevices: false)
    #endif
}
