//
//  FirebaseAuthApp+FirebaseCore.swift
//  FirebaseAuthClient
//
//  Created by Jose Miguel Benedicto Ruiz on 20/3/24.
//  Copyright © 2024 FirebaseAuthClient. All rights reserved.
//

import Foundation
import FirebaseAuthClient
import FirebaseCore

extension FirebaseAuthApp {
    public init(rawValue: FirebaseCore.FirebaseApp) {
        self.init(options: FirebaseOps())
        self.name = rawValue.name
        self.options = FirebaseOps(rawValue: rawValue.options)
    }
}
