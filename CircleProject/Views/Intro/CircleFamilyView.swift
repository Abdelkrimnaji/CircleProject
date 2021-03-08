//
//  CircleFamilyView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 06/01/2021.
//

import SwiftUI

struct CirclesConfigView: View {
    @State private var pseudo = ""
    @State private var email = ""
    var width = UIScreen.main.bounds.width
    @State private var isTutoCirclesPresented = false
    @Binding var tutoStep: Int
    @State var isMainMenuPresented = false
    
    @State var usersList: [User] = []
    var circle: CircleObject
    
    var body: some View {
        VStack {
            VStack{
                HStack {
                    Text("Configuration du")
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
                if circle.image != nil{
                    circle.image!
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                }
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
                    
                    ForEach(usersList, id: \.id){ user in
                        Text(user.name)
                            .onTapGesture{
                                self.circle.addUser(user)
                                self.pseudo = user.name
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
                        .foregroundColor(circle.color)
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
                self.tutoStep += 1
                if tutoStep > 3{
                    self.isMainMenuPresented.toggle()
                }else{
                    self.isTutoCirclesPresented.toggle()
                }
            }, label: {
                Text("Suivant")
                    .foregroundColor(.white)
            })
            .fullScreenCover(isPresented: $isMainMenuPresented){
                TabUIView(viewRouter: ViewRouter())
            }
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

struct CirclesConfigView_Previews: PreviewProvider {
    static var previews: some View {
        CirclesConfigView(tutoStep: .constant(1), circle: CircleObject(name: "Familial", image: nil, color: Color.black, type: .familial))
    }
}
