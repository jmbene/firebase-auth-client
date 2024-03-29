//
//  FirebaseOAuthCredential+FirebaseAuth.swift
//  FirebaseAuthClient
//
//  Created by Jose Miguel Benedicto Ruiz on 20/3/24.
//  Copyright © 2024 FirebaseAuthClient. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseAuthClient

extension FirebaseOAuthCredential {
    public init(rawValue: OAuthCredential) {
        self.init()
        self.idToken = rawValue.idToken
        self.accessToken = rawValue.accessToken
        self.secret = rawValue.secret
    }
}
