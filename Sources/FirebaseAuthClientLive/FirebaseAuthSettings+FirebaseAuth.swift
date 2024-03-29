//
//  FirebaseAuthSettings+FirebaseAuth.swift
//  FirebaseAuthClient
//
//  Created by Jose Miguel Benedicto Ruiz on 20/3/24.
//  Copyright © 2024 FirebaseAuthClient. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseAuthClient

extension FirebaseAuthSettings {
    public init(rawValue: AuthSettings) {
        self.init(appVerificationDisabledForTesting: false)
        self.appVerificationDisabledForTesting = rawValue.isAppVerificationDisabledForTesting
    }
}
