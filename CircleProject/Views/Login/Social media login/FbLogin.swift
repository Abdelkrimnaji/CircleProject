//
//  FbLogin.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 30/11/2020.
//

import SwiftUI
import FBSDKLoginKit

struct FbLogin: View {
    @AppStorage("logged") var logged = false
    @AppStorage("name") var name = ""
    @State var manager = LoginManager()
    @State private var isMainMenuPresented = false
    @StateObject var viewRouter = ViewRouter()
    
    var body: some View{
        VStack(spacing: 25){
            Button(action: {
                if logged{
                    manager.logOut()
                    name = ""
                    logged = false
                }else{
                    manager.logIn(permissions: ["public_profile","email"], from: nil) { (result, err) in
                        if err != nil {
                            print(err!.localizedDescription)
                            return
                        }
                        if !result!.isCancelled{
                            logged = true
                            
                            let request = GraphRequest(graphPath: "me", parameters: ["fields" : "name"])
//                            let request = GraphRequest(graphPath: "me/friends", parameters: ["fields" : "name"])
                            
                            request.start {(_,res,_) in
                                guard let profileData = res as? [String : Any] else{return}
                                name = (profileData["name"] as? String)!
                                self.isMainMenuPresented.toggle()
//                                dump(profileData)
                            }
                        }
                    }
                }
            }, label: {
                Image("facebook")
                    .resizable()
                    .scaledToFit()
            })
        }.fullScreenCover(isPresented: $isMainMenuPresented){
            TabUIView(viewRouter: viewRouter)
        }
    }
}

struct FbLogin_Previews: PreviewProvider {
    static var previews: some View {
        FbLogin()
    }
}
