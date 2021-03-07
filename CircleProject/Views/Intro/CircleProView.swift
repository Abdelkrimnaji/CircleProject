//
//  CircleProView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 06/01/2021.
//

import SwiftUI

struct CircleProView: View {
    @State  var pseudo = ""
    @State  var email = ""
    var width = UIScreen.main.bounds.width
    @State var isTutoCirclesPresented = false
    @Binding var tutoStep: Int
    @State var isMainMenuPresented = false
    var body: some View {
        VStack {
            VStack{
                HStack {
                    Text("Configuration du")
                        .font(.title)
                    Spacer()
                }
                HStack {
                    Text("Cercle Professionnel")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576))
                    Spacer()
                }.padding(.top, 5)
                Image("logoCircle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
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
            Button(action: {
                self.isMainMenuPresented.toggle()
            }, label: {
                Text("Suivant")
                    .foregroundColor(.white)
                    .font(.title2)
            })
            .fullScreenCover(isPresented: $isMainMenuPresented){
                TabUIView(viewRouter: ViewRouter())
            }
            .frame(width: width*0.8)
            .padding()
            .background(Color(red: 0.996, green: 0.557, blue: 0.576))
            .cornerRadius(12)
        }.padding()
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

struct CircleProView_Previews: PreviewProvider {
    static var previews: some View {
        CircleProView(tutoStep: .constant(3))
    }
}
