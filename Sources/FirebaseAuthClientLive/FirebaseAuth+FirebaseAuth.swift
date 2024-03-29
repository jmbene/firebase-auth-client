//
//  FirebaseAuth+FirebaseAuth.swift
//  FirebaseAuthClient
//
//  Created by Jose Miguel Benedicto Ruiz on 20/3/24.
//  Copyright © 2024 FirebaseAuthClient. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseAuthClient

extension FirebaseAuth {
    public init(rawValue: Auth) {
        self.init(shareAuthStateAcrossDevices: false)
        self.app = rawValue.app.map { FirebaseAuthApp(rawValue: $0) }
        self.currentUser = rawValue.currentUser.map { FirebaseUser(rawValue: $0) }
        self.languageCode = rawValue.languageCode
        self.settings = rawValue.settings.map { FirebaseAuthSettings(rawValue: $0) }
        self.userAccessGroup = rawValue.userAccessGroup
        self.shareAuthStateAcrossDevices = rawValue.shareAuthStateAcrossDevices
        self.tenantId = rawValue.tenantID
        #if os(iOS)
        self.apnsToken = rawValue.apnsToken
        #endif
        self.customAuthDomain = rawValue.customAuthDomain
    }
}
