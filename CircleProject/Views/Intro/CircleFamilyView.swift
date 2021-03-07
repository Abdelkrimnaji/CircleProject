//
//  CircleFamilyView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 06/01/2021.
//

import SwiftUI

struct CircleFamilyView: View {
    @State  var pseudo = ""
    @State  var email = ""
    var width = UIScreen.main.bounds.width
    @State var isTutoCirclesPresented = false
    @Binding var tutoStep: Int
    
    @State var usersList: [Users] = []
    
    var body: some View {
        VStack {
            VStack{
                HStack {
                    Text("Configuration du")
                        .font(.title2)
                    Spacer()
                }
                HStack {
                    Text("Cercle Familial")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576))
                    Spacer()
                }.padding(.top, 5)
                Image("logoCircle")
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
                        }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
                    
                    ForEach(usersList, id: \.user_id){ user in
                        Text(user.username)
                            .onTapGesture{
                                self.pseudo = user.username
                                self.usersList.removeAll()
                            }
                    }
                }.padding(.top, 50)
                Text("ou")
                    .font(.title2)
                    .foregroundColor(.gray)
                VStack(alignment: .leading) {
                    Text("Invitez vos proches :")
                        .font(.title)
                        .foregroundColor(Color(red: 90/255, green: 105/255, blue: 120/255))
                    HStack {
                        TextField("Email", text: $email)
                            .font(.title)
                            .padding(.leading, 10)
                    }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
                }.padding(.top)
//                Button(action: {
//                    Api().sendMail(email:email) { (response,error)  in
//                        if error != nil{
//                            print(error!.localizedDescription)
//                        }else if let response = response{
//                            print(response.status_message)
//                        }
//                    }
//                }, label: {
//                    Text("Inviter")
//                        .foregroundColor(.white)
//                })
//                .frame(width: width*0.5)
//                .padding()
//                .background(Color(red: 0.996, green: 0.557, blue: 0.576))
//                .cornerRadius(20)
//                .padding()
            }
            Spacer()
            Button(action: {
                self.isTutoCirclesPresented.toggle()
                self.tutoStep += 1
            }, label: {
                Text("Suivant")
                    .foregroundColor(.white)
            })
            .frame(width: width*0.8)
            .padding()
            .background(Color(red: 0.996, green: 0.557, blue: 0.576))
            .cornerRadius(12)
        }.padding()
        .onChange(of: self.pseudo, perform: { value in
//            self.cleanList = false
            Api().getUsers(username: self.pseudo,completion: { (users, error) in
                if error != nil{
                    print(error!.localizedDescription)
                }else if let users = users{
//                    if !cleanList{
                        self.usersList = users
//                    }else{
//                        self.usersList = []
//                    }
                }
            })
        })
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

struct CircleFamilyView_Previews: PreviewProvider {
    static var previews: some View {
        CircleFamilyView(tutoStep: .constant(1))
    }
}
