//
//  FirebaseMultifactorInfo+FirebaseAuth.swift
//  FirebaseAuthClient
//
//  Created by Jose Miguel Benedicto Ruiz on 20/3/24.
//  Copyright © 2024 FirebaseAuthClient. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseAuthClient

#if os(iOS)
extension FirebaseMultifactorInfo {
    public init(rawValue: MultiFactorInfo) {
        self.init()
        self.displayName = rawValue.displayName
        self.enrollmentDate = rawValue.enrollmentDate
        self.factorId = rawValue.factorID
        self.uid = rawValue.uid
    }
}
#endif
