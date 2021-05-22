//
//  MenuView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 18/11/2020.
//

import SwiftUI

struct MenuView: View {
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                HStack {
                    Image("elon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .clipShape(Circle())
                    VStack(alignment: .leading){
                    Text("Elon")
                        .fontWeight(.bold)
                    Text("Gray, 70100")
                        .foregroundColor(.primary)
                    }
                    Spacer()
                }.padding()
                Divider()
                NavigationLink(
                    destination: NotificationsView(),
                    label: {
                        HStack {
                            Image(systemName: "bell")
                            Text("Notifications")
                                .fontWeight(.bold)
                        }.foregroundColor(.primary)
                    }).padding()
                Divider()
                VStack{
                    HStack{
                        Image(systemName: "person")
                        Text("Mon profil")
                            .fontWeight(.bold)
                        Spacer()
                    }
                    List{
                        NavigationLink(
                            destination: SettingView(),
                            label: {
                                Text("Données personnelles")
                            })
                        NavigationLink(destination: PasswordView()) {
                            Text("Mot de passe")
                        }
                        Text("Notifications")
                        Text("Centres d'intêret")
                    }.frame(height: 180)
                    .foregroundColor(.gray)
                    .font(.subheadline)
                }.padding()
                Divider()
                HStack{
                    Image(systemName: "mail")
                    Text("Mes annonces")
                        .fontWeight(.bold)
                }.padding()
                Divider()
                HStack{
                    Image(systemName: "questionmark.square")
                    Text("Aide")
                        .fontWeight(.bold)
                }.padding()
                Divider()
                
            }.background(Color.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .overlay(Rectangle().stroke(Color.primary.opacity(0.2),lineWidth: 2).shadow(radius: 3))
        }
        
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct PasswordView: View {
    @State var oldPassword = ""
    @State var newPassword = ""
    
    var body: some View{
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                if oldPassword.count > 0{
                    Text("Mot de passe actuel")
                        .fontWeight(.semibold)
                        .animation(.spring())
                }
                HStack {
                    TextField("Mot de passe actuel", text: $oldPassword)
                        .font(.headline)
                        .padding(.leading, 5)
                }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
                Divider()
            }.padding(.top, UIScreen.main.bounds.height*0.05)
            VStack(alignment: .leading){
                if newPassword.count > 0{
                    Text("Nouveau mot de passe")
                        .fontWeight(.semibold)
                }
                HStack {
                    TextField("Nouveau mot de passe", text: $newPassword)
                        .font(.headline)
                        .padding(.leading, 5)
                }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
                Divider()
            }.padding(.top, UIScreen.main.bounds.height*0.05)
            Spacer()
            Button(action: {
                
            }, label: {
                Text("Enregistrer")
                    .foregroundColor(.white)
            })
            .disabled(true)
            .frame(width: UIScreen.main.bounds.width*0.8)
            .padding()
            .background(Color(red: 0.996, green: 0.557, blue: 0.576))
            .cornerRadius(12)
        }.padding()
        
        .navigationTitle("Mot de passe")
    }
}
