//
//  ConnectionView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 14/11/2020.
//

import SwiftUI

struct ConnectionView: View {
    var with = UIScreen.main.bounds.width
    @State var email:String = ""
    @State var password:String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isMainMenuPresented = false
    var body: some View {
        VStack {
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
                TextField("Email", text: $email)
                    .padding(10)
                    .border(Color.gray)
                TextField("Créer un mot de passe", text: $password)
                    .padding(10)
                    .border(Color.gray)
                Button("Continuer") {
                    self.isMainMenuPresented.toggle()
                }
                .foregroundColor(.white)
                .padding(10)
                .fullScreenCover(isPresented: $isMainMenuPresented, content: TabUIView.init)
                .frame(width: with*0.7)
                .background(Color(red: 0.996, green: 0.557, blue: 0.576))
            }
            .frame(width: with*0.7)
            .padding(.top)
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
