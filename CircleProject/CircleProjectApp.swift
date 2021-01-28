//
//  CircleProjectApp.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 08/11/2020.
//

import SwiftUI
import FBSDKCoreKit
import GoogleSignIn

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
class AppDelegate: NSObject,UIApplicationDelegate, GIDSignInDelegate{
    func application(_ application: UIApplication,
                             didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
      
        GIDSignIn.sharedInstance().clientID = "553312109313-vlm6m002idat0a7jb2c4l9m51bkbtu87.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self  // If AppDelegate conforms to GIDSignInDelegate
        return true
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
                withError error: Error!) {
        if (error == nil) {
            
        } else {
            print(error.localizedDescription)
        }
    }
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
      if let error = error {
        if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
          print("The user has not signed in before or they have since signed out.")
        } else {
            print(error.localizedDescription)
        }
        return
      }
      let fullName = user.profile.name
//      let givenName = user.profile.givenName
//      let familyName = user.profile.familyName
//      let email = user.profile.email
        print(fullName!)
//        self.isMainMenuPresented.toggle()
    }
}
