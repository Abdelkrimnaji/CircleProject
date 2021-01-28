//
//  MenuView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 18/11/2020.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("elon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                VStack(alignment: .leading){
                Text("Elon")
                    .fontWeight(.bold)
                Text("Gray, 70100")
                    .foregroundColor(.primary)
                }
                Spacer()
            }.padding()
            Divider()
            HStack{
                Image(systemName: "person")
                Text("Mon profil")
            }.padding()
            Divider()
            HStack{
                Image(systemName: "questionmark.square")
                Text("Aide")
            }.padding()
            Divider()
            Spacer()
        }.background(Color.white)
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(Rectangle().stroke(Color.primary.opacity(0.2),lineWidth: 2).shadow(radius: 3))
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
