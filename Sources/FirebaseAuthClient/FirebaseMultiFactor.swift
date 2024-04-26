//
//  FirebaseMultiFactor.swift
//  FirebaseAuthClient
//
//  Created by Jose Miguel Benedicto Ruiz on 19/3/24.
//  Copyright © 2024 FirebaseAuthClient. All rights reserved.
//

import Foundation

#if os(iOS)
public struct FirebaseMultiFactor: Equatable {
    public var multifactor: [FirebaseMultifactorInfo]
    
    public init(multifactor: [FirebaseMultifactorInfo]) {
        self.multifactor = multifactor
    }
}
#endif
