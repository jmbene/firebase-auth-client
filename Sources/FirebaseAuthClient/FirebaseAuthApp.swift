//
//  FirebaseAuthApp.swift
//  FirebaseAuthClient
//
//  Created by Jose Miguel Benedicto Ruiz on 19/3/24.
//  Copyright © 2024 FirebaseAuthClient. All rights reserved.
//

import Foundation

public struct FirebaseAuthApp {
    public var name: String?
    public var options: FirebaseOps
    
    public init(
        name: String? = nil,
        options: FirebaseOps) {
        
        self.name = name
        self.options = options
    }
}
