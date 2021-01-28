//
//  InstaUIView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 21/12/2020.
//

import SwiftUI

struct InstaUIView: View {
    @State var presentAuth = false
    @State var testUserData = InstagramTestUser(access_token: "", user_id: 0)
    @State var instagramApi = InstagramApi.shared
    @State var signedIn = false
    @State var instagramUser: InstagramUser? = nil
    @State private var isMainMenuPresented = false
    var body: some View {
        VStack{
            Button(action: {
                if self.testUserData.user_id == 0 {
                    self.presentAuth.toggle()
                } else {
                    self.instagramApi.getInstagramUser(testUserData: self.testUserData) { (user) in
                        self.instagramUser = user
                        self.signedIn.toggle()
//                        self.isMainMenuPresented.toggle()
                        print("connected")
                    }
                    
                }
            }){
                Image("instagram")
                    .resizable()
                    .scaledToFit()
            }
        }
//        .fullScreenCover(isPresented: $isMainMenuPresented, content: TabUIView.init)
        .sheet(isPresented: self.$presentAuth) {
            WebView(presentAuth: self.$presentAuth, testUserData: self.$testUserData, instagramApi: self.$instagramApi)
        }
        .actionSheet(isPresented: self.$signedIn) {
            let actionSheet = ActionSheet(title: Text("Signed in:"), message: Text("with account: @\(self.instagramUser!.username)"),buttons: [.default(Text("OK"))])
            return actionSheet
        }
    }
}

struct InstaUIView_Previews: PreviewProvider {
    static var previews: some View {
        InstaUIView()
    }
}
