//
//  CardItemView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 08/11/2020.
//

import SwiftUI

struct CardItemView: View {
    var card: CardItem
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var body: some View {
        VStack{
            Spacer()
            HStack {
                Image(systemName: card.profileImage)
                    .foregroundColor(.gray)
                    .font(.title)
                Text(card.profileName)
                Spacer()
            }
            Spacer()
            VStack {
                Spacer()
                Image(card.cardImage)
                    .resizable()
                    .scaledToFit()
                Spacer()
                    VStack(alignment: .leading){
                        HStack {
                            Text(card.title)
                                .font(.subheadline)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        Text(card.category)
                            .foregroundColor(.gray)
                            .font(.subheadline)
//                        Text("\(Int(card.price)!, specifier: "%.2f")€")
                        Text("\(card.price)€")
                            .foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576))
                    }
                Spacer()
            }.padding(.leading, 0)
        }
        .frame(width: width*0.38, height:height*0.3)
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray, lineWidth: 2))
    }
}

struct CardItemView_Previews: PreviewProvider {
    static var previews: some View {
        CardItemView(card: CardItem(profileImage: "person.crop.circle.fill", card_id: "1", profileName: "So701", cardImage: "clio", title: "Clio IV GT 2019", category: "Voiture", price: "15000", description: ""))
//        CardItemView(card: CardItem(profileImageName: "person.crop.circle.fill", profileName: "Abdoul701", imageName: "real", title: "Mallot \"Authentique\" Real", category: "Mode", price: 60))
    }
}
