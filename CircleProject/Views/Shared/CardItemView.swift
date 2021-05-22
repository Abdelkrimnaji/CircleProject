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
                    .foregroundColor(.primary)
                Spacer()
            }
            Spacer()
            VStack {
                Spacer()
                let mainImage = self.card.cardImage.components(separatedBy: ",")
                Image("placeholder")
                    .data(url: URL(string: mainImage[0])!)
                        .resizable()
                        .scaledToFit()
                    .cornerRadius(5)
                Spacer()
                    VStack(alignment: .leading){
                        HStack {
                            Text(card.title)
                                .font(.subheadline)
                                .foregroundColor(.primary)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        Text(card.category)
                            .foregroundColor(.gray)
                            .font(.subheadline)
                        Text("\(card.price)€")
                            .foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576))
                    }
                Spacer()
            }
        }
        .frame(width: width*0.38, height:height*0.3)
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray, lineWidth: 2))
    }
}

struct CardItemView_Previews: PreviewProvider {
    static var previews: some View {
        CardItemView(card: CardItem(profileImage: "person.crop.circle.fill", card_id: "1", profileName: "So701", cardImage: "file:///Users/abdelkrimnaji/Public/iOS/CircleProject/CircleProject/Assets.xcassets/annonce%20media/clio.imageset/clio.jpg", title: "Clio IV GT 2019", category: "Voiture", price: "15000", description: ""))
//        CardItemView(card: CardItem(profileImageName: "person.crop.circle.fill", profileName: "Abdoul701", imageName: "real", title: "Mallot \"Authentique\" Real", category: "Mode", price: 60))
    }
}

extension Image {
    func data(url:URL) -> Self {
        if let data = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data)!)
                    .resizable()
        }
        return self
            .resizable()
    }
}
