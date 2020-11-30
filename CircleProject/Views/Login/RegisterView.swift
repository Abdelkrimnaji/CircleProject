//
//  RegisterView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 09/11/2020.
//

import SwiftUI

struct RegisterView: View {
    @State private var pseudo: String = ""
    var with = UIScreen.main.bounds.width
    @State private var registerStep = 33.33
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isCategorySelectionPresented = false
    var body: some View {
        VStack {
            if registerStep == 33.33{
                VStack(alignment: .leading) {
                    Text("Quel est votre pseudo ?")
                        .font(.title2)
                    HStack {
                        TextField("Pseudo", text: $pseudo)
                            .font(.title2)
                            .padding(.leading, 5)
                    }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
                }.padding(.top)
            }else if registerStep == 66.66{
                VStack(alignment: .leading) {
                    Text("Quel est votre âge ?")
                        .font(.title2)
                    HStack {
                        TextField("Age", text: $pseudo)
                            .font(.title2)
                            .padding(.leading, 5)
                    }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
                    Text("Vous vous définissez en tant que ?")
                        .font(.title2)
                }.padding(.top)
            }else{
                VStack(alignment: .leading) {
                    Text("Choisissez votre localisation :")
                        .font(.title2)
                        .padding(.bottom, 5)
                    Text("Nous voulons nous assurer de trouver les offres les plus pertinentes pour vous.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom, 5)
                    HStack {
                        TextField("Région", text: $pseudo)
                            .font(.title2)
                            .padding(.leading, 5)
                    }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
                    Text("ou")
                        .foregroundColor(.gray)
                    HStack {
                        TextField("Département", text: $pseudo)
                            .font(.title2)
                            .padding(.leading, 5)
                    }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
                    Text("ou")
                        .foregroundColor(.gray)
                    HStack {
                        TextField("Ville", text: $pseudo)
                            .font(.title2)
                            .padding(.leading, 5)
                    }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
                    Text("ou")
                        .foregroundColor(.gray)
                    HStack{
                        Image("pointer")
                            .foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576))
                        Text("Géolocalisation automatique")
                            .font(.title2)
                            .foregroundColor(.gray)
                            .fontWeight(.light)
                    }
                }.padding(.top)
            }
            
            Spacer()
            if registerStep <= 100{
            VStack {
                HStack{
                    Spacer()
                    Text("\(registerStep/33.33, specifier: "%.f") sur 3")
                }
                ProgressView("", value: registerStep, total: 100)
            }.padding()
            }
            Button(action: {
                    self.registerStep+=33.33
                if registerStep > 100{
                    self.isCategorySelectionPresented.toggle()
                }
            }, label: {
                Text("Suivant")
                    .foregroundColor(.white)
            })
            .fullScreenCover(isPresented: $isCategorySelectionPresented, content: CategorySelectionView.init)
            .frame(width: with*0.8)
            .padding()
            .background(Color(red: 0.996, green: 0.557, blue: 0.576))
            .cornerRadius(20)
            Spacer()
        }.padding()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("S'inscrire")
                    .font(.largeTitle)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: { self.presentationMode.wrappedValue.dismiss()}) {
            HStack {
                Image(systemName: "arrow.left")
            }
        })
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
