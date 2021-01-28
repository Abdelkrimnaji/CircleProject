//
//  SellStep2.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 26/01/2021.
//

import SwiftUI

struct SellStep2: View {
    @State private var annonceDescription = ""
    private var width = UIScreen.main.bounds.width
    var body: some View {
        VStack(spacing: 30) {
            VStack {
                HStack {
                    Text("Photos & Description")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576))
                    Spacer()
                }
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
                    Image("camera")
                        .frame(width: width*0.5)
                    Image("plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: width*0.15)
                        .padding(.bottom,-10)
                }
                Divider()
                    .padding()
                HStack {
                    TextField("Description de l'annonce", text: $annonceDescription)
                        .font(.title2)
                        .padding(.leading, 5)
                }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
                Spacer()
            }
        }.padding()
    }
}

struct SellStep2_Previews: PreviewProvider {
    static var previews: some View {
        SellStep2()
    }
}
