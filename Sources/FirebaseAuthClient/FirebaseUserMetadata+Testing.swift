//
//  FirebaseUserMetadata+Testing.swift
//  FirebaseAuthClient
//
//  Created by Jose Miguel Benedicto Ruiz on 19/3/24.
//  Copyright © 2024 FirebaseAuthClient. All rights reserved.
//

import Foundation

extension FirebaseUserMetadata {
    public static let mock = Self(
        lastSignInDate: ISO8601DateFormatter().date(from: "2024-03-01T00:00:00+0000"),
        creationDate: ISO8601DateFormatter().date(from: "2023-08-06T00:00:00+0000")
    )
}
