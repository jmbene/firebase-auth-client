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

#if os(iOS)
extension FirebaseMultiFactor {
    public init(rawValue: MultiFactor) {
        self.init(multifactor: [])
        self.multifactor = rawValue.enrolledFactors.compactMap { FirebaseMultifactorInfo(rawValue: $0) }
    }
}
#endif
