//
//  SubscriberConfigView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 16/04/2021.
//

import SwiftUI

struct SubscriberConfigView: View {
    @State private var pseudo = ""
    @State private var email = ""
    var width = UIScreen.main.bounds.width
    @State private var addButton = false
    @State var userToAdd = User()
    @State var usersList: [User] = []
    var circle: CircleObject
    
    var userId = UserDefaults.standard.string(forKey: "userId")
    
    var body: some View {
        VStack {
            VStack{
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
                            if addButton{
                                Image(systemName: "plus.circle")
                                    .font(.title)
                                    .foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576))
                                    .onTapGesture {
                                        Api().sendNotification(senderId: Int(userId!)!, receiverId: Int(userToAdd.id)!, circleId: circle.id) { (message, error) in
                                            if error != nil{
                                                print(error!.localizedDescription)
                                            }else if let message=message{
                                                print(message.status_message)
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
                                self.addButton = true
                                self.userToAdd = user
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
            }
            Spacer()
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
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Configuration")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(Color(red: 84/255, green: 84/255, blue: 84/255))
            }
        }
    }
}

struct SubscriberConfigView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriberConfigView(circle: CircleObject.familial)
    }
}
