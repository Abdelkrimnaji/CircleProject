//
//  FirstScreenView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 09/11/2020.
//

import SwiftUI

struct FirstScreenView: View {
    var with = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    @StateObject var user: User = User()
    
    var body: some View {
        NavigationView{
//            ScrollView{
                VStack {
                Spacer()
                    .frame(height: height*0.2)
                HStack {
                    Image("logoCircle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90)
                    Text("Circle")
                        .fontWeight(.bold)
                        .font(.system(size: 70))
                        .foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576))
                }.padding(.bottom)
                VStack{
                    NavigationLink(destination: RegisterView(user: user)) {
                        Text("Créer un compte")
                            .foregroundColor(.white)
                            .padding(10)
                    }
                    .frame(width: with*0.7)
                    .background(Color(red: 0.996, green: 0.557, blue: 0.576))
                    NavigationLink(destination: ConnectionView()) {
                        Text("Se connecter")
                    }
                }.padding(.top)
                Spacer()
            }
//            }
        }
    }
}

struct FirstScreenView_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreenView()
    }
}
