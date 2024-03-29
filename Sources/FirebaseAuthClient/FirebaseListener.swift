//
//  FirebaseListener.swift
//  FirebaseAuthClient
//
//  Created by Jose Miguel Benedicto Ruiz on 19/3/24.
//  Copyright © 2024 FirebaseAuthClient. All rights reserved.
//

import Foundation

public struct FirebaseListener {
    public var auth: FirebaseAuth?
    public var user: FirebaseUser?
    
    public init(
        auth: FirebaseAuth? = nil,
        user: FirebaseUser? = nil) {
            
        self.auth = auth
        self.user = user
    }
}
