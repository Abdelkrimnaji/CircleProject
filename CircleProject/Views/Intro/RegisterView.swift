//
//  RegisterView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 09/11/2020.
//

import SwiftUI

struct RegisterView: View {
    @State private var pseudo = ""
    @State private var email = ""
    private var width = UIScreen.main.bounds.width
    @State private var registerStep = 33.3
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isCategorySelectionPresented = false
    @State private var isChecked = false
    @State private var checklistItems = [
        ChecklistItem(name: "Homme"),
        ChecklistItem(name: "Femme"),
        ChecklistItem(name: "Autre")
    ]
    var body: some View {
        VStack(spacing: 20) {
            if registerStep == 33.3{
                VStack(alignment: .leading) {
                    Text("Quel est votre pseudo ?")
                        .font(.title2)
                    HStack {
                        TextField("Pseudo", text: $pseudo)
                            .font(.title2)
                            .padding(.leading, 5)
                    }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
                    Text("Quel est votre email ?")
                        .font(.title2)
                        .padding(.top)
                    HStack {
                        TextField("Email", text: $email)
                            .font(.title2)
                            .padding(.leading, 5)
                    }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
                }.padding(.top)
            }else if registerStep == 66.6{
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
                        .padding(.top)
//                    Button(action: {isChecked.toggle()}){
//                        HStack{ Image(systemName: isChecked ? "checkmark.square": "square")
//                            Text("title")
//                        }
//                    }
                    
//                    List {
                        ForEach(checklistItems) { checklistItem in
                            HStack {
                                Image(systemName: checklistItem.isChecked ? "checkmark.circle": "circle")
                                    .font(.title3)
                                    .foregroundColor(Color(red: 131/255, green: 145/255, blue: 165/255))
//                                Spacer()
                                Text(checklistItem.name)
                                    .font(.title3)
                                    .foregroundColor(.gray)
                            }.padding(.top, 5)
                            .onTapGesture {
                                if let matchingIndex =
                                  self.checklistItems.firstIndex(where: { $0.id == checklistItem.id }) {
////                                    if !self.checklistItems[0]{
                                
////                                    }
                                  self.checklistItems[matchingIndex].isChecked.toggle()
//                                    print(matchingIndex)
                                }
                                for number in 0...2 {
                                    if number != self.checklistItems.firstIndex(where: { $0.id == checklistItem.id }) {
                                        self.checklistItems[0].isChecked.toggle()
                                    }
                                }
//                                self.printChecklistContents()
                              }
                            }
//                    }
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
                        Text("\(registerStep/33, specifier: "%.f") sur 3")
                    }
                    ProgressView("", value: registerStep, total: 100)
                }.padding()
            }
            Button(action: {
                self.registerStep += 33.3
                if registerStep > 100{
                    self.isCategorySelectionPresented.toggle()
                }
            }, label: {
                Text("Suivant")
                    .foregroundColor(.white)
            })
            .fullScreenCover(isPresented: $isCategorySelectionPresented, content: CategorySelectionView.init)
            .frame(width: width*0.8)
            .padding()
            .background(Color(red: 0.996, green: 0.557, blue: 0.576))
            .cornerRadius(20)
        }.padding()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("S'inscrire")
                    .font(.largeTitle)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.registerStep -= 33.3
            if registerStep < 33{
                self.presentationMode.wrappedValue.dismiss()
            }
        }) {
            Image(systemName: "arrow.left")
        })
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
