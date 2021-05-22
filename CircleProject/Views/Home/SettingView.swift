//
//  SettingView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 27/04/2021.
//

import SwiftUI

struct SettingView: View {
    @State var pseudo = ""
    @State var email = ""
    @State var gender = ""
    @State var age = ""
    @State var location = ""
    @State var categories = ""
    var userName = UserDefaults.standard.string(forKey: "userName")
    @State var userDetails = User()
    @State var editProfil = false
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
                    Image("elon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .clipShape(Circle())
                    if editProfil{
                        Image("pencil")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30)
                            .foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576))
                    }
                }
                VStack(alignment: .leading){
                    Text("Genre")
                        .fontWeight(.semibold)
                    HStack {
                        TextField(userDetails.gender, text: $gender)
                            .font(.headline)
                            .padding(.leading, 5)
                            .disabled(editProfil ? false : true)
                    }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
                    Divider()
                }
                VStack(alignment: .leading){
                    Text("Pseudo")
                        .fontWeight(.semibold)
                    HStack {
                        TextField(userDetails.name, text: $pseudo)
                            .font(.headline)
                            .padding(.leading, 5)
                            .disabled(editProfil ? false : true)
                    }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
                    Divider()
                }
                VStack(alignment: .leading){
                    Text("Email")
                        .fontWeight(.semibold)
                    HStack {
                        TextField(userDetails.email, text: $email)
                            .keyboardType(.numberPad)
                            .font(.headline)
                            .padding(.leading, 5)
                            .disabled(editProfil ? false : true)
                    }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
                    Divider()
                }
                VStack(alignment: .leading){
                    Text("Age")
                        .fontWeight(.semibold)
                    HStack {
                        TextField(userDetails.age, text: $age)
                            .keyboardType(.numberPad)
                            .font(.headline)
                            .padding(.leading, 5)
                            .disabled(editProfil ? false : true)
                    }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
                    Divider()
                }
                VStack(alignment: .leading){
                    Text("Localisation")
                        .fontWeight(.semibold)
                    HStack {
                        TextField(userDetails.location, text: $location)
                            .keyboardType(.numberPad)
                            .font(.headline)
                            .padding(.leading, 5)
                            .disabled(editProfil ? false : true)
                    }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
                    Divider()
                }
                VStack(alignment: .leading){
                    Text("Centres d'intêret")
                        .fontWeight(.semibold)
                    HStack {
                        TextField("Centres d'intêret", text: $categories)
                            .keyboardType(.numberPad)
                            .font(.headline)
                            .padding(.leading, 5)
                            .disabled(editProfil ? false : true)
                    }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
                    Divider()
                }
                if editProfil{
                    Button(action: {
                        
                    }, label: {
                        Text("Enregistrer")
                            .foregroundColor(.white)
                    })
                    .frame(width: UIScreen.main.bounds.width*0.8)
                    .padding()
                    .background(Color(red: 0.996, green: 0.557, blue: 0.576))
                    .cornerRadius(12)
                }
            }.navigationBarItems(trailing: Button(action: {
                self.editProfil.toggle()
            }, label: {
                Image("pencil")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    .foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576))
            }))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Données personelles")
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 84/255, green: 84/255, blue: 84/255))
                }
            }
        }.padding()
        .onAppear{
            Api().getUsers(username: userName!,completion: { (user, error) in
                if error != nil{
                    print(error!.localizedDescription)
                }else if let user = user{
                    self.userDetails = user[0]
                }
            })
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
