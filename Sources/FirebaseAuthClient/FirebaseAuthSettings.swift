//
//  FirebaseAuthSettings.swift
//  FirebaseAuthClient
//
//  Created by Jose Miguel Benedicto Ruiz on 19/3/24.
//  Copyright © 2024 FirebaseAuthClient. All rights reserved.
//

import Foundation

public struct FirebaseAuthSettings: Equatable {
    public var appVerificationDisabledForTesting: Bool
    
    public init(appVerificationDisabledForTesting: Bool) {
        self.appVerificationDisabledForTesting = appVerificationDisabledForTesting
    }
}


