//
//  FirebaseUser+Testing.swift
//  FirebaseAuthClient
//
//  Created by Jose Miguel Benedicto Ruiz on 19/3/24.
//  Copyright © 2024 FirebaseAuthClient. All rights reserved.
//

import Foundation

extension FirebaseUser {
    
    public static let mock = Self(
        anonymous: false,
        emailVerified: false,
        providerData: [FirebaseUserInfo.mock],
        metadata: FirebaseUserMetadata.mock)
    
}


