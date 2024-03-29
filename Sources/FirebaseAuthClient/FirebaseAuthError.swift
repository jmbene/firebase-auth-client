//
//  FirebaseAuthError.swift
//  FirebaseAuthClient
//
//  Created by Jose Miguel Benedicto Ruiz on 19/3/24.
//  Copyright © 2024 FirebaseAuthClient. All rights reserved.
//

import Foundation

public enum FirebaseAuthError: Error, Equatable {
    case noCredential
    case bundleNotFound
}
