//
//  FirebaseUserMetadata.swift
//  FirebaseAuthClient
//
//  Created by Jose Miguel Benedicto Ruiz on 19/3/24.
//  Copyright © 2024 FirebaseAuthClient. All rights reserved.
//

import Foundation

public struct FirebaseUserMetadata {
    public var lastSignInDate: Date?
    public var creationDate: Date?
    
    public init(
        lastSignInDate: Date? = nil,
        creationDate: Date? = nil) {
            
        self.lastSignInDate = lastSignInDate
        self.creationDate = creationDate
    }
}
