//
//  CircleFamilyView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 06/01/2021.
//

import SwiftUI
import PKHUD

struct CirclesConfigView: View {
    @State private var pseudo = ""
    @State private var email = ""
    var width = UIScreen.main.bounds.width
    @State private var isTutoCirclesPresented = false
    @Binding var tutoStep: Int
    @State var isMainMenuPresented = false
    @State private var sendNotificationButton = false
//    @State private var sendEmailButton = false
    @State var userToAdd = User()
    @State var usersList: [User] = []
    var circle: CircleObject
    
    var userId = UserDefaults.standard.string(forKey: "userId")
    @Binding var shouldPopToRootView : Bool
    
    var body: some View {
        VStack {
            VStack{
                HStack {
                    Text("Configuration du Cercle")
                        .font(.title2)
                    Spacer()
                }
                HStack {
                    Text(circle.name)
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576))
                    Spacer()
                }.padding(.top, 5)
                circle.image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
            }.padding(.top)
            VStack {
                VStack(alignment: .leading) {
                        Text("Cherchez parmis nos membres")
                            .font(.title)
                            .foregroundColor(Color(red: 90/255, green: 105/255, blue: 120/255))
                        HStack {
                            TextField("Pseudo", text: $pseudo)
                                .font(.title)
                                .padding(.leading, 10)
                            if sendNotificationButton{
                                Image(systemName: "plus.circle")
                                    .font(.title)
                                    .foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576))
                                    .onTapGesture {
                                        Api().sendNotification(senderId: Int(userId!)!, receiverId: Int(userToAdd.id)!, circleId: circle.id) { (message, error) in
                                            if error != nil{
                                                print(error!.localizedDescription)
                                            }else if let message=message{
                                                if message.status == 1{
                                                    HUD.flash(.success, delay: 2.0)
                                                    self.pseudo = ""
                                                }else{
                                                    HUD.show(.error)
                                                    HUD.hide(afterDelay: 2.0)
                                                    
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                        HUD.flash(.label("Vous avez déjà invité cette personne dans ce cercle"), delay: 2.0)
                                                    }
                                                    self.pseudo = ""
                                                    print(message.status_message)
                                                }
                                            }
                                        }
                                    }
                            }
                        }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
                    
                    ForEach(usersList, id: \.id){ user in
                        Text(user.name)
                            .onTapGesture{
                                self.pseudo = user.name
                                self.usersList.removeAll()
                                self.usersList = []
                                self.sendNotificationButton = true
                                self.userToAdd = user
                            }
                    }
                }.padding(.top, 50)
                HStack{
                    VStack{
                        Divider()
                    }
                    Text("ou")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    VStack{
                        Divider()
                    }
                }.padding(.top)
                VStack(alignment: .leading) {
                    Text("Invitez vos proches :")
                        .font(.title)
                        .foregroundColor(Color(red: 90/255, green: 105/255, blue: 120/255))
                    HStack {
                        TextField("Email", text: $email)
                            .font(.title)
                            .padding(.leading, 10)
                        if email.count > 3{
                            Image(systemName: "plus.circle")
                                .font(.title)
                                .foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576))
                                .onTapGesture {
                                    Api().checkMail(email:email) { (response,error)  in
                                        if error != nil{
                                            print(error!.localizedDescription)
                                        }else if let response = response{
                                            if response.status == 1{
                                                Api().sendMail(email:email) { (response,error)  in
                                                    if error != nil{
                                                        print(error!.localizedDescription)
                                                    }else if let response = response{
                                                        if response.status == 1{
                                                            HUD.flash(.success, delay: 2.0)
                                                            self.email = ""
                                                        }else{
                                                            HUD.show(.error)
                                                            HUD.hide(afterDelay: 2.0)

                                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                                HUD.flash(.label("Une erreur s'est produite"), delay: 2.0)
                                                            }
                                                            print(response.status_message)
                                                        }
                                                    }
                                                }
                                            }else{
                                                HUD.show(.error)
                                                HUD.hide(afterDelay: 2.0)
                                                
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                    HUD.flash(.label("L'adresse mail est invalide"), delay: 2.0)
                                                }
                                                print(response.status_message)
                                            }
                                        }
                                    }
                                }
                        }
                    }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
                }.padding(.top)
            }
            Spacer()
            Button(action: {
                if tutoStep >= 3{
                    self.isMainMenuPresented.toggle()
                }else{
                    self.tutoStep += 1
                    self.shouldPopToRootView = false
                    self.isTutoCirclesPresented.toggle()
                }
            }, label: {
                Text("Suivant")
                    .foregroundColor(.white)
            }).fullScreenCover(isPresented: $isMainMenuPresented){
                TabUIView(viewRouter: ViewRouter())
            }
            .frame(width: width*0.8)
            .padding()
            .background(Color(red: 0.996, green: 0.557, blue: 0.576))
            .cornerRadius(12)
        }.padding()
        .onChange(of: self.pseudo, perform: { value in
            Api().getUsers(username: self.pseudo,completion: { (users, error) in
                if error != nil{
                    print(error!.localizedDescription)
                }else if let users = users{
                        self.usersList = users
                }
            })
        })
//        .onChange(of: self.email, perform: { value in
//            if email.count > 3{
//                sendEmailButton.toggle()
//            }
////            Api().sendMail(email:email) { (response,error)  in
////                if error != nil{
////                    print(error!.localizedDescription)
////                }else if let response = response{
////                    print(response.status_message)
////                }
////            }
//        })
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Bienvenue sur Circle !")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .foregroundColor(Color(red: 84/255, green: 84/255, blue: 84/255))
            }
        }
    }
}

struct CirclesConfigView_Previews: PreviewProvider {
    static var previews: some View {
        CirclesConfigView(tutoStep: .constant(0), circle: CircleObject(id: 1, name: "Familial", image: Image("CercleFamille"), color: Color.black, type: .familial, size: 0.25), shouldPopToRootView: .constant(false))
    }
}
