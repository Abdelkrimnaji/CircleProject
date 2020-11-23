//
//  BuyView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 08/11/2020.
//

import SwiftUI

struct SellView: View {
    var circleCardList: [CardItem] = [
        CardItem(profileImageName: "person.crop.circle.fill", profileName: "Abdoul701", imageName: "real", title: "Mallot \"Authentique\" Real", category: "Mode", price: 60),
        CardItem(profileImageName: "person.crop.circle.fill", profileName: "Palermo70", imageName: "rolex", title: "Rolex Date Just", category: "Mode", price: 10000),
        CardItem(profileImageName: "person.crop.circle.fill", profileName: "So701", imageName: "clio", title: "Clio IV GT 2019", category: "Voiture", price: 15000),
        CardItem(profileImageName: "person.crop.circle.fill", profileName: "Abdoul701", imageName: "real", title: "Mallot \"Authentique\" Real", category: "Mode", price: 60),
        CardItem(profileImageName: "person.crop.circle.fill", profileName: "Palermo70", imageName: "rolex", title: "Rolex Date Just", category: "Mode", price: 10000),
        CardItem(profileImageName: "person.crop.circle.fill", profileName: "So701", imageName: "clio", title: "Clio IV GT 2019", category: "Voiture", price: 15000)
    ]
    let colums = [
        GridItem(.adaptive(minimum: 150))
    ]
    @State var showAllCirleItems:Bool = false
    var height = UIScreen.main.bounds.height
    var width = UIScreen.main.bounds.width
    var body: some View {
        ScrollView{
            Button(action: {
                self.showAllCirleItems.toggle()
            }
            , label: {
                Text("Annonces selon vous cercles")
                    .foregroundColor(.gray)
            }).padding(.leading)
            
            if showAllCirleItems{
                ScrollView(.vertical){
                    LazyVGrid(columns: [GridItem(),GridItem()], content: /*@START_MENU_TOKEN@*/{
                        ForEach(circleCardList){ card in
                            CardItemView(card: card)
                        }
                    })
                }
            }else{
                ScrollView(.horizontal){
                    LazyHGrid(rows: [GridItem()], content:{
                        ForEach(circleCardList){ card in
                            CardItemView(card: card)
                        }
                    })
                }.frame(height:height*0.4)
            }
        }
    }
}

struct BuyView_Previews: PreviewProvider {
    static var previews: some View {
        SellView()
    }
}
