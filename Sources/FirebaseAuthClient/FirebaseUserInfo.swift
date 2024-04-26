//
//  FirebaseUserInfo.swift
//  FirebaseAuthClient
//
//  Created by Jose Miguel Benedicto Ruiz on 19/3/24.
//  Copyright © 2024 FirebaseAuthClient. All rights reserved.
//

import Foundation

public struct FirebaseUserInfo: Equatable {
    public var providerId: String?
    public var uid: String?
    public var displayName: String?
    public var photoURL: URL?
    public var email: String?
    public var phoneNumber: String?
    
    public init(
        providerId: String? = nil,
        uid: String? = nil,
        displayName: String? = nil,
        photoURL: URL? = nil,
        email: String? = nil,
        phoneNumber: String? = nil) {
        
        self.providerId = providerId
        self.uid = uid
        self.displayName = displayName
        self.photoURL = photoURL
        self.email = email
        self.phoneNumber = phoneNumber
    }
}

