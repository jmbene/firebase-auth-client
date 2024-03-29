# FirebaseAuthClient

A small Firebase client library that wraps [FirebaseAuth](https://firebase.google.com/docs/auth/ios/start?hl=es-419) implementing a dependency using [Dependencies](https://github.com/pointfreeco/swift-dependencies) library from [Point-Free](https://www.pointfree.co).
                                                          
This client is based in the functional programming concept of the [Protocol Witnesses](https://nsscreencast.com/episodes/486-codable-witnesses-1) where the compiler transforms under the hood the code written with protocols into Swift structs and extensions with the help of generics. It also uses the latest Swift Concurrency features (Tasks, Async/Await, Actors...). This enables to have full control of the dependency for tests or SwiftUI previews.
                                                                                       
This client is ready to be use in any app that follows the [Composable Architecture](https://github.com/pointfreeco/swift-composable-architecture).
                                                                                       
## Installation

You can add FirebaseAuthClient to an Xcode project by adding it to your project as a package.

> https://github.com/jmbene/FirebaseAuthClient

If you want to use `FirebaseAuthClient` in a [SwiftPM](https://swift.org/package-manager/) project, it's as
simple as adding it to your `Package.swift`:

``` swift
dependencies: [
  .package(url: "https://github.com/jmbene/firebase-auth-client", from: "1.0.0")
]
```

There are two products that can be added to any target:
* `FirebaseAuthClientLive` does contain the Firebase dependency that is necessary for the real world app targets.

```swift
.product(name: "FirebaseAuthClientLive", package: "firebase-auth-client"),
```

* `FirebaseAuthClient` is the interface or lightweight part of the library, does *not* contain any Firebase dependency which is interesting for abstracting the dependency for your test targets and mock it. 
```swift
.product(name: "FirebaseAuthClient", package: "firebase-auth-client"),
```

## Sample App

The library includes a sample app that makes use of it. In order to use it, the user will need to create a new project in Firebase. Please follow steps 1-3 from [Firebase guide](https://firebase.google.com/docs/ios/setup) and then follow these instructions:
1. Override the file `GoogleService-Info.plist` with the one downloaded from Firebase after setting up your project.
1. Replace the Bundle ID of the sample app for the one you have set up in your Firebase project. 
1. Replace the URL Scheme found in the `Info.plist` of the sample app, otherwise `FirebaseAuthClientLive` will crash.
1. Set up the Authentication module in your Firebase project.

If you want to use the GitHub Provider, complete the following steps:
1. Go to Access Method section of the Authentication module in your Firebase project.
1. Enable the GitHub provider.
1. Copy the callback URL that Firebase generated for your project.
1. Sign in GitHub and then [create](https://github.com/settings/developers) a *New OAuth App*.
1. Fill the required information (*Application Name* and *Homepage URL*) with the values you like, then paste the callback URL copied from Firebase project before in the Authorization callback URL field.
1. Access the details of your OAuth App and copy the *Client ID* and *Client Secret* from the OAuth app to your GitHub provider in your Firebase project to end the wiring between GitHub and Firebase.

## Unit Test

Unit tests better executed locally using the firebase emulator. Download it using Homebrew:
```
brew install firebase-cli
```

Then init the firebase cli, select the Emulators and configure it for the project created before in the section before [Sample App](#sample-app), using defaults values:
```
firebase init
```

This will generate some config files and so you can finally start the emulator with the following command:
```
firebase emulators:start --import data --export-on-exit
```

## Further information

* Configure Firebase Emulator [here](https://www.youtube.com/watch?v=q-9lx7aSWcc&t=259s).
* Brandon Williams [talk](https://www.youtube.com/watch?v=3BVkbWXcFS4) from App Builders 2019.


