//
//  FirebaseMultiFactorInfo.swift
//  FirebaseAuthClient
//
//  Created by Jose Miguel Benedicto Ruiz on 19/3/24.
//  Copyright © 2024 FirebaseAuthClient. All rights reserved.
//

import Foundation

public struct FirebaseMultifactorInfo: Equatable {
    public var uid: String?
    public var displayName: String?
    public var enrollmentDate: Date?
    public var factorId: String?
   
    public init(
        uid: String? = nil,
        displayName: String? = nil,
        enrollmentDate: Date? = nil,
        factorId: String? = nil) {
            
        self.uid = uid
        self.displayName = displayName
        self.enrollmentDate = enrollmentDate
        self.factorId = factorId
    }
}
