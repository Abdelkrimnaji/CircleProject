//
//  GoogleLogin.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 02/12/2020.
//

import SwiftUI
import GoogleSignIn

struct GoogleLogin: View {
    @State var isMainMenuPresented = false
    var body: some View {
        Button(action: {
            GIDSignIn.sharedInstance()?
                .presentingViewController=UIApplication.shared.windows.first?.rootViewController
            GIDSignIn.sharedInstance()?.signIn()
        }, label:{
            Image("google")
                .resizable()
                .scaledToFit()
        }).fullScreenCover(isPresented: $isMainMenuPresented, content: TabUIView.init)
    }
}

struct GoogleLogin_Previews: PreviewProvider {
    static var previews: some View {
        GoogleLogin()
    }
}
