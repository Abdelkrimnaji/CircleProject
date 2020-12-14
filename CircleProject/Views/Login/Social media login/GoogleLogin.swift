//
//  GoogleLogin.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 02/12/2020.
//

import SwiftUI
import GoogleSignIn

struct GoogleLogin: View {
    var body: some View {
        Button(action: {
            GIDSignIn.sharedInstance()?
                .presentingViewController=UIApplication.shared.windows.first?.rootViewController
            GIDSignIn.sharedInstance()?.signIn()
        }, label:{
            Image("google")
                .resizable()
                .scaledToFit()
        })
    }
}


class AppDelegate: NSObject,UIApplicationDelegate, GIDSignInDelegate{
    func application(_ application: UIApplication,
                             didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        // Initialize sign-in
        GIDSignIn.sharedInstance().clientID = "553312109313-vlm6m002idat0a7jb2c4l9m51bkbtu87.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self  // If AppDelegate conforms to GIDSignInDelegate
        return true
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
                withError error: Error!) {
        if (error == nil) {
            // Perform any operations on signed in user here.
            // ...
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
      // Perform any operations on signed in user here.
//      let userId = user.userID                  // For client-side use only!
//      let idToken = user.authentication.idToken // Safe to send to the server
      let fullName = user.profile.name
//      let givenName = user.profile.givenName
//      let familyName = user.profile.familyName
//      let email = user.profile.email
        print(fullName!)
    }
}
struct GoogleLogin_Previews: PreviewProvider {
    static var previews: some View {
        GoogleLogin()
    }
}
