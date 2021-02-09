//
//  SellStep3.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 01/02/2021.
//

import SwiftUI

struct SellStep3: View {
    @State private var diffuseForFamily = false
    @State private var diffuseForFriends = false
    @State private var diffuseForPro = false
    @State private var diffuseForPublic = false
    var body: some View {
        VStack {
            HStack {
                Text("Configuration de la liste de diffusion")
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 253/255, green: 143/255, blue: 147/255))
                Spacer()
            }.padding(.bottom)
            HStack {
                Text("Choisissez les cercles qui visualiseront votre annonce. Vous pouvez modifiez à tout moment cette liste de diffusion dans les paramètres de votre annonce.")
                    .foregroundColor(.gray)
                    .font(.subheadline)
                    .opacity(0.6)
                    .padding(.bottom)
                Spacer()
            }
            Toggle(isOn: $diffuseForFamily) {
                Text("Cercle Familial")
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 253/255, green: 143/255, blue: 147/255))
            }.padding(.horizontal)
            Toggle(isOn: $diffuseForFriends) {
                Text("Cercle Amical")
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 214/255, green: 101/255, blue: 105/255))
            }.padding(.horizontal)
            Toggle(isOn: $diffuseForPro) {
                Text("Cercle Professionnel")
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 235/255, green: 71/255, blue: 78/255))
            }.padding(.horizontal)
            Toggle(isOn: $diffuseForPublic) {
                Text("Cercle Public")
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 168/255, green: 42/255, blue: 48/255))
            }.padding(.horizontal)
            Spacer()
        }.toggleStyle(SwitchToggleStyle(tint: Color(red: 253/255, green: 143/255, blue: 147/255)))
    }
}

struct SellStep3_Previews: PreviewProvider {
    static var previews: some View {
        SellStep3()
    }
}
