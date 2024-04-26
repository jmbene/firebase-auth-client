//
//  FirebaseUser.swift
//  FirebaseAuthClient
//
//  Created by Jose Miguel Benedicto Ruiz on 19/3/24.
//  Copyright © 2024 FirebaseAuthClient. All rights reserved.
//

import Foundation

public struct FirebaseUser: Equatable {
    public var anonymous: Bool
    public var emailVerified: Bool
    public var refreshToken: String?
    public var providerData: [FirebaseUserInfo]
    public var metadata: FirebaseUserMetadata?
    public var tenantId: String?
    #if os(iOS)
    public var multifactor: FirebaseMultiFactor?
    #endif
    
    #if os(iOS)
    public init(
        anonymous: Bool,
        emailVerified: Bool,
        refreshToken: String? = nil,
        providerData: [FirebaseUserInfo],
        metadata: FirebaseUserMetadata? = nil,
        tenantId: String? = nil,
        multifactor: FirebaseMultiFactor? = nil) {
            
        self.anonymous = anonymous
        self.emailVerified = emailVerified
        self.refreshToken = refreshToken
        self.providerData = providerData
        self.metadata = metadata
        self.tenantId = tenantId
        self.multifactor = multifactor
    }
    #else
    public init(
        anonymous: Bool,
        emailVerified: Bool,
        refreshToken: String? = nil,
        providerData: [FirebaseUserInfo],
        metadata: FirebaseUserMetadata? = nil,
        tenantId: String? = nil) {
            
        self.anonymous = anonymous
        self.emailVerified = emailVerified
        self.refreshToken = refreshToken
        self.providerData = providerData
        self.metadata = metadata
        self.tenantId = tenantId
    }
    #endif
}


