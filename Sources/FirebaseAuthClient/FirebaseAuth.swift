//
//  FirebaseAuth.swift
//  FirebaseAuthClient
//
//  Created by Jose Miguel Benedicto Ruiz on 19/3/24.
//  Copyright © 2024 FirebaseAuthClient. All rights reserved.
//

import Foundation

public struct FirebaseAuth: Equatable {
    public var app: FirebaseAuthApp?
    public var currentUser: FirebaseUser?
    public var languageCode: String?
    public var settings: FirebaseAuthSettings?
    public var userAccessGroup: String?
    public var shareAuthStateAcrossDevices: Bool
    public var tenantId: String?
    public var apnsToken: Data?
    public var customAuthDomain: String?
    
    public init(
        app: FirebaseAuthApp? = nil,
        currentUser: FirebaseUser? = nil,
        languageCode: String? = nil,
        settings: FirebaseAuthSettings? = nil,
        userAccessGroup: String? = nil,
        shareAuthStateAcrossDevices: Bool,
        tenantId: String? = nil,
        apnsToken: Data? = nil,
        customAuthDomain: String? = nil) {
            
        self.app = app
        self.currentUser = currentUser
        self.languageCode = languageCode
        self.settings = settings
        self.userAccessGroup = userAccessGroup
        self.shareAuthStateAcrossDevices = shareAuthStateAcrossDevices
        self.tenantId = tenantId
        self.apnsToken = apnsToken
        self.customAuthDomain = customAuthDomain
    }
}


