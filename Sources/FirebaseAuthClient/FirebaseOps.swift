//
//  FirebaseOptions.swift
//  FirebaseAuthClient
//
//  Created by Jose Miguel Benedicto Ruiz on 19/3/24.
//  Copyright © 2024 FirebaseAuthClient. All rights reserved.
//

import Foundation

public struct FirebaseOps {
    public var apiKey: String?
    public var bundleId: String?
    public var clientId: String?
    public var gcmSenderId: String?
    public var projectId: String?
    public var googleAppId: String?
    public var databaseURL: String?
    public var deepLinkURLScheme: String?
    public var storageBucket: String?
    public var appGroupId: String?

    public init(
        apiKey: String? = nil,
        bundleId: String? = nil,
        clientId: String? = nil,
        gcmSenderId: String? = nil,
        projectId: String? = nil,
        googleAppId: String? = nil,
        databaseURL: String? = nil,
        deepLinkURLScheme: String? = nil,
        storageBucket: String? = nil,
        appGroupId: String? = nil) {
        
        self.apiKey = apiKey
        self.bundleId = bundleId
        self.clientId = clientId
        self.gcmSenderId = gcmSenderId
        self.projectId = projectId
        self.googleAppId = googleAppId
        self.databaseURL = databaseURL
        self.deepLinkURLScheme = deepLinkURLScheme
        self.storageBucket = storageBucket
        self.appGroupId = appGroupId
    }
}

