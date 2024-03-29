//
//  FirebaseUserInfo+Testing.swift
//  FirebaseAuthClient
//
//  Created by Jose Miguel Benedicto Ruiz on 19/3/24.
//  Copyright © 2024 FirebaseAuthClient. All rights reserved.
//

import Foundation

extension FirebaseUserInfo {
    
    public static let mock = Self(
        providerId: "github.com",
        uid: "12345678",
        displayName: "Blob",
        photoURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Emoji_u1f632.svg/240px-Emoji_u1f632.svg.png")!,
        email: "blob@blob.com",
        phoneNumber: "123456789")
}

