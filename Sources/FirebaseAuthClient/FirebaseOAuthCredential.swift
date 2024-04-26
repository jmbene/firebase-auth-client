//
//  FirebaseOAuthCredential.swift
//  FirebaseAuthClient
//
//  Created by Jose Miguel Benedicto Ruiz on 19/3/24.
//  Copyright © 2024 FirebaseAuthClient. All rights reserved.
//

import Foundation

public struct FirebaseOAuthCredential: Equatable {
    public var idToken: String?
    public var accessToken: String?
    public var secret: String?
    
    public init(
        idToken: String? = nil,
        accessToken: String? = nil,
        secret: String? = nil) {
            
        self.idToken = idToken
        self.accessToken = accessToken
        self.secret = secret
    }
}
