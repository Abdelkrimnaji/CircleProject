//
//  RegisterView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 09/11/2020.
//

import SwiftUI

struct RegisterView: View {
    @State private var width = UIScreen.main.bounds.width
    @State private var registerStep = 33.3
    @State private var isCategorySelectionPresented = false
    private let checklistItem = [ "Homme", "Femme", "Autre"]
    @State var selectedGender: String? = nil
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var user: User
    
    var body: some View {
        
        NavigationView{
            VStack(spacing: 20) {
                if registerStep == 33.3{
                    VStack(alignment: .leading) {
                        Text("Quel est votre pseudo ?")
                            .font(.title2)
                        HStack {
                            TextField("Pseudo", text: $user.name)
                                .disableAutocorrection(true)
                                .font(.title2)
                                .padding(.leading, 5)
                        }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
                        Text("Quel est votre email ?")
                            .font(.title2)
                            .padding(.top)
                        HStack {
                            TextField("Email", text: $user.email)
                                .disableAutocorrection(true)
                                .font(.title2)
                                .padding(.leading, 5)
                        }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
                    }.padding(.top)
                }else if registerStep == 66.6{
                    VStack(alignment: .leading) {
                        Text("Quel est votre âge ?")
                            .font(.title2)
                        HStack {
                            TextField("Age", text: $user.age)
                                .keyboardType(.numberPad)
                                .font(.title2)
                                .padding(.leading, 5)
                        }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
                        
                        Text("Vous vous définissez en tant que ?")
                            .font(.title2)
                            .padding(.top)
                        ForEach(checklistItem, id: \.self) { item in
                            HStack {
                                if item == selectedGender {
                                    Image(systemName:"largecircle.fill.circle")
                                        .font(.headline)
                                        .foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576))
                                }else{
                                    Image(systemName: "circle")
                                        .font(.headline)
                                        .foregroundColor(Color.gray)
                                }
                                Text(item)
                                    .font(.title3)
                                    .foregroundColor(.gray)
                            }.onTapGesture {
                                self.selectedGender = item
                                user.gender = item
                            }.padding(.top, 5)
                        }
                    }.padding(.top)
                }else{
                    UserLocationView(user: user)
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
                        //                    Api().register(user: user) { (message, error) in
                        //                        if error != nil {
                        //                            print(error!.localizedDescription)
                        //                        }else{
                        //                            print(message!.status_message)
                        //                        }
                        //                    }
                    }
                }, label: {
                    Text("Suivant")
                        .foregroundColor(.white)
                })
                .fullScreenCover(isPresented: $isCategorySelectionPresented){
                    CategorySelectionView(user: user)
                }
                .frame(width: width*0.8)
                .padding()
                .background(Color(red: 0.996, green: 0.557, blue: 0.576))
                .cornerRadius(12)
            }.padding()
            .navigationBarHidden(true)
            .navigationTitle("")
        }
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
        RegisterView(user: User())
    }
}
