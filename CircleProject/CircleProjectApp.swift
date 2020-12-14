//
//  CircleProjectApp.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 08/11/2020.
//

import SwiftUI
import FBSDKCoreKit

@main
struct CircleProjectApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL(perform: { url in
                ApplicationDelegate.shared.application(UIApplication.shared, open: url, sourceApplication: nil, annotation: UIApplication.OpenURLOptionsKey.annotation)
            })
        }
    }
}
