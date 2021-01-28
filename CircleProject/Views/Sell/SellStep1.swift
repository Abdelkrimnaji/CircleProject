//
//  SellStep1.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 26/01/2021.
//

import SwiftUI

struct SellStep1: View {
    @State private var annonceTitle = ""
    @State private var annoncePrice = ""
    @State private var isOfferChecked = false
    @State private var isRequestChecked = false
    private var width = UIScreen.main.bounds.width
    var body: some View {
        VStack{
            HStack {
                Text("Annonce")
                    .font(.title)
                    .foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576))
                Spacer()
            }.padding(.bottom)
            VStack(alignment: .leading){
                Button(action: {
                    isOfferChecked.toggle()
                }, label: {
                    HStack(alignment: .top){
                        Image(systemName: isOfferChecked ? "checkmark.circle": "circle")
                            .font(.title3)
                            .foregroundColor(Color(red: 131/255, green: 145/255, blue: 165/255))
                        VStack(alignment: .leading) {
                            Text("Offre")
                                .font(.title2)
                                .fontWeight(.bold)
                            Text("Si vous souhaitez vendre un article")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }.padding(.bottom)
                })
                
                HStack(alignment: .top){
                    Image(systemName: isRequestChecked ? "checkmark.circle": "circle")
                        .font(.title3)
                        .foregroundColor(Color(red: 131/255, green: 145/255, blue: 165/255))
                    VStack(alignment: .leading) {
                        Text("Demande")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("Si vous recherchez un article")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            Divider().padding(.vertical)
            NavigationLink(
                destination: SellCatogories(),
                label: {
                    HStack{
                        Text("Sélectionnez la catégorie")
                            .font(.headline)
                        foregroundColor(.primary)
                        Image(systemName: "chevron.right")
                            .font(.title2)
                            .foregroundColor(.gray)
                    }.padding(10)
                    .frame(width: width*0.7)
                    .overlay(RoundedRectangle(cornerRadius: 2).stroke(Color.gray, lineWidth: 2))
                })
            Divider().padding(.vertical)
            VStack{
                HStack {
                    TextField("Titre de l'annonce", text: $annonceTitle)
                        .font(.title2)
                        .padding(.leading, 5)
                }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
                .padding(.bottom)
                Divider()
                HStack {
                    TextField("Prix de l'annonce", text: $annoncePrice)
                        .font(.title2)
                        .padding(.leading, 5)
                }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
                .padding(.top)
            }
            Divider().padding(.vertical)
            HStack{
                Text("Localisation de votre bien ?")
                    .font(.headline)
                Image(systemName: "chevron.right")
                    .font(.title2)
                    .foregroundColor(.gray)
            }.padding(10)
            .frame(width: width*0.7)
            .overlay(RoundedRectangle(cornerRadius: 2).stroke(Color.gray, lineWidth: 2))
            Divider().padding(.vertical)
            Spacer()
        }
//        .padding()
    }
}

struct SellStep1_Previews: PreviewProvider {
    static var previews: some View {
        SellStep1()
    }
}
