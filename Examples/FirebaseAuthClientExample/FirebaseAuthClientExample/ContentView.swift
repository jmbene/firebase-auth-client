//
//  ContentView.swift
//  FirebaseAuthClientExample
//
//  Created by Jose Miguel Benedicto Ruiz on 19/3/24.
//

import SwiftUI
import Dependencies
import FirebaseAuthClient
import FirebaseAuthClientLive
import UserDefaultsDependency

@Observable
class ContentViewModel {
    var accessToken: String?
    var user: FirebaseUser?
    var isLogged: Bool { user != nil && accessToken != nil }
    
    @ObservationIgnored @Dependency(\.authClient) var authClient
    @ObservationIgnored @Dependency(\.userDefaults) var userDefaults
    
    init() {
        self.accessToken = userDefaults.string(forKey: "accessToken")
    }
    
    func login() async {
        guard let credential = try? await authClient.getGitHubOAuthCredential(),
        let accessToken = credential.accessToken else {
            return
        }
        userDefaults.set(accessToken, forKey: "accessToken")
        self.accessToken = accessToken
    }
    
    func logout() async {
        try? authClient.logout()
        userDefaults.removeValue(forKey: "accessToken")
        accessToken = nil
    }
    
    func canOpenURL(_ url: URL) -> Bool {
        authClient.canHandleURL(url)
    }
    
    func startListener() async {
        for await status in authClient.listener() {
            await handleStatus(status: status)
        }
    }
    
    func handleStatus(status: FirebaseListener) async {
        self.user = status.user
        if user != nil {
            if accessToken == nil {
                await login()
            }
        } else {
            if accessToken != nil {
                await logout()
            }
        }
    }
}


struct ContentView: View {
    @State var contentViewModel = ContentViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if contentViewModel.isLogged,
                    let user = contentViewModel.user,
                    let userData = user.providerData.first {
                    
                    Form {
                        Section(header: Text("User")) {
                            LabeledContent("UID") { Text(userData.uid ?? "") }
                            LabeledContent("Provider") { Text(userData.providerId ?? "") }
                            LabeledContent("Name") { Text(userData.displayName ?? "") }
                            LabeledContent("Email") { Text(userData.email ?? "") }
                        }
                    }
                    Spacer()
                    HStack {
                        Text("Access token: \(contentViewModel.accessToken ?? "")")
                        Spacer()
                    }
                    .padding()
                } else {
                    Button {
                        Task {
                            await contentViewModel.login()
                        }
                    } label: {
                        Text("Sign In with Github")
                    }
                }
            }
            .toolbar(content: {
                if contentViewModel.isLogged {
                    Button {
                        Task {
                            await contentViewModel.logout()
                        }
                    } label: {
                        Text("Logout")
                    }
                } else {
                    EmptyView()
                }
            })
        }
        .task {
            await contentViewModel.startListener()
        }
    }
}

#Preview {
    ContentView(
        contentViewModel: withDependencies { dependencies in
            dependencies.authClient = .alwaysLoggedIn
        }
        operation: {
            ContentViewModel()
        }
    )
}
