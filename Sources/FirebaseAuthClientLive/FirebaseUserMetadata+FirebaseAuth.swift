//
//  FirebaseUserMetadata+FirebaseAuth.swift
//  FirebaseAuthClient
//
//  Created by Jose Miguel Benedicto Ruiz on 19/3/24.
//  Copyright © 2024 FirebaseAuthClient. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseAuthClient

extension FirebaseUserMetadata {
    public init(rawValue: UserMetadata) {
        self.init()
        self.lastSignInDate = rawValue.lastSignInDate
        self.creationDate = rawValue.creationDate
    }
}
