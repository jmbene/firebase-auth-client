//
//  FirebaseUser+FirebaseAuth.swift
//  FirebaseAuthClient
//
//  Created by Jose Miguel Benedicto Ruiz on 19/3/24.
//  Copyright © 2024 FirebaseAuthClient. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseAuthClient

extension FirebaseUser {
    public init(rawValue: User) {
        self.init(anonymous: false, emailVerified: false, providerData: [])
        self.anonymous = rawValue.isAnonymous
        self.emailVerified = rawValue.isEmailVerified
        self.refreshToken = rawValue.refreshToken
        self.providerData = rawValue.providerData.compactMap { FirebaseUserInfo(rawValue: $0) }
        self.metadata = FirebaseUserMetadata(rawValue: rawValue.metadata)
        self.tenantId = rawValue.tenantID
        #if os(iOS)
        self.multifactor = FirebaseMultiFactor(rawValue: rawValue.multiFactor)
        #endif
    }
}
