//
//  FirebaseUserInfo+FirebaseAuth.swift
//  FirebaseAuthClient
//
//  Created by Jose Miguel Benedicto Ruiz on 19/3/24.
//  Copyright © 2024 FirebaseAuthClient. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseAuthClient

extension FirebaseUserInfo {
    public init(rawValue: UserInfo) {
        self.init()
        self.providerId = rawValue.providerID
        self.uid = rawValue.uid
        self.displayName = rawValue.displayName
        self.photoURL = rawValue.photoURL
        self.email = rawValue.email
        self.phoneNumber = rawValue.phoneNumber
    }
}
