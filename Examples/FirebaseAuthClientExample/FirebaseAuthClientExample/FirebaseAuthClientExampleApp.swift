//
//  FirebaseAuthClientExampleApp.swift
//  FirebaseAuthClientExample
//
//  Created by Jose Miguel Benedicto Ruiz on 19/3/24.
//

import SwiftUI
import Dependencies
import FirebaseAuthClientLive

@main
struct FirebaseAuthClientExampleApp: App {
    
    @UIApplicationDelegateAdaptor(FirebaseAuthClientExampleAppDelegate.self) var appDelegate
    @Dependency(\.authClient) var authClient
    
    var body: some Scene {
        WindowGroup {
            ContentView(contentViewModel: ContentViewModel())
                .onOpenURL { url in
                    _ = authClient.canHandleURL(url)
                }
        }
    }
}
