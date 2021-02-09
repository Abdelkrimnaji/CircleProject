//
//  SellStep4.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 02/02/2021.
//

import SwiftUI

struct SellStep4: View {
    @State private var profileMail = ""
    @State private var phoneNumber = ""
    @State private var maskPhoneNumber = false
    var body: some View {
        VStack {
            HStack {
                Text("Confirmation de vos coordonées")
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 253/255, green: 143/255, blue: 147/255))
                Spacer()
            }.padding(.bottom)
            HStack {
                Text("Merci d'entrer un email et un numéro de téléphone valide.")
                    .foregroundColor(.gray)
                    .font(.subheadline)
                    .opacity(0.6)
                    .padding(.bottom)
                Spacer()
            }
            Divider()
                .padding(.vertical)
            HStack {
                TextField("Email du profil *", text: $profileMail)
                    .font(.title2)
                    .padding(.leading, 5)
            }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
            Divider()
                .padding(.vertical)
            HStack {
                TextField("Numéro de téléphone *", text: $phoneNumber)
                    .keyboardType(.numberPad)
                    .font(.title2)
                    .padding(.leading, 5)
            }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
            Divider()
                .padding(.vertical)
            Toggle(isOn: $maskPhoneNumber) {
                Text("Masquer le Numéro")
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 90/255, green: 105/255, blue: 120/255))
            }.padding(.horizontal)
            .padding(.top)
            .toggleStyle(SwitchToggleStyle(tint: Color(red: 253/255, green: 143/255, blue: 147/255)))
            Spacer()
            HStack {
                Text("* Champs obligatoires")
                    .foregroundColor(.gray)
                    .opacity(0.5)
                Spacer()
            }
        }
    }
}

struct SellStep4_Previews: PreviewProvider {
    static var previews: some View {
        SellStep4()
    }
}