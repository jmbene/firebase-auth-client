//
//  FirebaseListener+Testing.swift
//  FirebaseAuthClient
//
//  Created by Jose Miguel Benedicto Ruiz on 19/3/24.
//  Copyright © 2024 FirebaseAuthClient. All rights reserved.
//

import Foundation

extension FirebaseListener {
    public static let loggedIn = Self(
        auth: FirebaseAuth.loggedIn,
        user: FirebaseUser.mock)
    
    public static let loggedOut = Self(
        auth: FirebaseAuth.loggedOut,
        user: nil)
}
