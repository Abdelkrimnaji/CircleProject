//
//  ConnectionView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 14/11/2020.
//

import SwiftUI

struct ConnectionView: View {
    var width = UIScreen.main.bounds.width
    @State var username = ""
    @State var password = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isMainMenuPresented = false
    
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
                TextField("Entrer votre mot de passe", text: $password)
                    .padding(10)
                    .border(Color.gray)
                Button("Continuer") {
                    Api().login(username: username,password: password) { (request,error)  in
                        if error != nil{
                            print(error!.localizedDescription)
                        }else if request!.status == 1{
                            self.isMainMenuPresented.toggle()
                        }
                    }
                }
                .foregroundColor(.white)
                .padding(10)
//                .fullScreenCover(isPresented: $isMainMenuPresented, content: TabUIView.init)
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
