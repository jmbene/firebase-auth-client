//
//  FirebaseOps+FirebaseCore.swift
//  FirebaseAuthClient
//
//  Created by Jose Miguel Benedicto Ruiz on 19/3/24.
//  Copyright © 2024 FirebaseAuthClient. All rights reserved.
//

import Foundation
import FirebaseCore
import FirebaseAuthClient

extension FirebaseOps {
    public init(rawValue: FirebaseCore.FirebaseOptions) {
        self.init()
        self.apiKey = rawValue.apiKey
        self.bundleId = rawValue.bundleID
        self.clientId = rawValue.clientID
        self.gcmSenderId = rawValue.gcmSenderID
        self.projectId = rawValue.projectID
        self.googleAppId = rawValue.googleAppID
        self.databaseURL = rawValue.databaseURL
        self.deepLinkURLScheme = rawValue.deepLinkURLScheme
        self.storageBucket = rawValue.storageBucket
        self.appGroupId = rawValue.appGroupID
    }
}
