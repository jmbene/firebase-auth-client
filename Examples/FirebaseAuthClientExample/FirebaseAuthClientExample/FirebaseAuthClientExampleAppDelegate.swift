//
//  FirebaseAuthClientExampleAppDelegate.swift
//  FirebaseAuthClientExample
//
//  Created by Jose Miguel Benedicto Ruiz on 19/3/24.
//

import Foundation

import UIKit
import Dependencies
import FirebaseAuthClient


class FirebaseAuthClientExampleAppDelegate: NSObject, UIApplicationDelegate {
    
    @Dependency(\.authClient) var authClient
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        try? authClient.configure(Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist")!)
        return true
    }
}
