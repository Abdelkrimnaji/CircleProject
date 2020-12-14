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
                            request.start {(_,res,_) in
                                guard let profileData = res as? [String : Any] else{return}
                                name = (profileData["name"] as? String)!
                            }
                        }
                    }
                }
            }, label: {
                Image("facebook")
                    .resizable()
                    .scaledToFit()
            })
//            Text(name)
//                .fontWeight(.bold)
        }
    }
}

struct FbLogin_Previews: PreviewProvider {
    static var previews: some View {
        FbLogin()
    }
}
