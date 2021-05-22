//
//  ConnectionView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 14/11/2020.
//

import SwiftUI

struct ConnectionView: View {
    @State private var showingAlert = false
    var width = UIScreen.main.bounds.width
    @State var username = ""
    @State var password = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isMainMenuPresented = false
    @AppStorage("userId") var userId = ""
    @AppStorage("userName") var userName = ""
    @AppStorage("logged") var logged = false
    
    @StateObject var viewRouter = ViewRouter()
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Image("logoCircle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                Text("Circle")
                    .fontWeight(.bold)
                    .font(.system(size: 70))
                    .foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576))
            }.padding(.bottom)
            VStack{
                TextField("Entrer votre pseudo", text: $username)
                    .padding(10)
                    .border(Color.gray)
                SecureField("Entrer votre mot de passe", text: $password)
                    .padding(10)
                    .border(Color.gray)
                Button("Continuer") {
                    Api().login(username: username,password: password) { (message,error)  in
                        if error != nil{
                            print(error!.localizedDescription)
                        }else if message!.status == 1{
                            self.isMainMenuPresented.toggle()
                            logged = true
                            userId = message!.user_id!
                            userName = username
                        }else if message!.status == 0{
                            showingAlert = true
                        }
                    }
                } .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Erreur"), message: Text("Identifiant ou mot de passe incorrect."), dismissButton: Alert.Button.default(
                        Text("Réessayer"), action: {
                            self.username = ""
                            self.password = ""
                        }
                    ))
                }
                .foregroundColor(.white)
                .padding(10)
                .fullScreenCover(isPresented: $isMainMenuPresented){
                    TabUIView(viewRouter: viewRouter)
                }
                .frame(width: width*0.7)
                .background(Color(red: 0.996, green: 0.557, blue: 0.576))
            }
            .frame(width: width*0.7)
            .padding(.top)
            VStack{
                Text("ou continuez avec :")
                    .padding()
                HStack{
                    FbLogin()
                        .frame(width: width*0.15)
                    Spacer()
                    GoogleLogin()
                        .frame(width: width*0.15)
                }.frame(width: width*0.35)
                HStack{
                    Button(action: {
//                        Api().register(completion: (messagesServer?, Error?) -> ())
                    }, label: {
                        Image("twitter")
                            .resizable()
                            .scaledToFit()
                            .frame(width: width*0.15)
                    })
                    
                    Spacer()
                    InstaUIView()
                        .frame(width: width*0.15)
                }
                .frame(width: width*0.35)
                .padding(.top)
            }.padding(.top)
            Spacer()
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.left")
                })
        }
    }
}

struct ConnectionView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectionView()
    }
}
