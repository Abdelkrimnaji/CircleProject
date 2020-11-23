//
//  HomeView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 08/11/2020.
//

import SwiftUI

struct HomeView: View {
    var circleCardList: [CardItem] = [
        CardItem(profileImageName: "person.crop.circle.fill", profileName: "Abdoul701", imageName: "real", title: "Mallot \"Authentique\" Real", category: "Mode", price: 60),
        CardItem(profileImageName: "person.crop.circle.fill", profileName: "Palermo70", imageName: "rolex", title: "Rolex Date Just", category: "Mode", price: 10000),
        CardItem(profileImageName: "person.crop.circle.fill", profileName: "So701", imageName: "clio", title: "Clio IV GT 2019", category: "Voiture", price: 15000),
        CardItem(profileImageName: "person.crop.circle.fill", profileName: "Abdoul701", imageName: "real", title: "Mallot \"Authentique\" Real", category: "Mode", price: 60),
        CardItem(profileImageName: "person.crop.circle.fill", profileName: "Palermo70", imageName: "rolex", title: "Rolex Date Just", category: "Mode", price: 10000),
        CardItem(profileImageName: "person.crop.circle.fill", profileName: "So701", imageName: "clio", title: "Clio IV GT 2019", category: "Voiture", price: 15000)
    ]
    var desireCardList: [CardItem] = [
        CardItem(profileImageName: "person.crop.circle.fill", profileName: "Jo du 77", imageName: "chemise", title: "Chemise", category: "Mode", price: 55),
        CardItem(profileImageName: "person.crop.circle.fill", profileName: "Bob", imageName: "montre", title: "Fossil", category: "Mode", price: 150),
        CardItem(profileImageName: "person.crop.circle.fill", profileName: "Donald", imageName: "2cv", title: "Citroen 2CV 1988", category: "Voiture", price: 150000),
        CardItem(profileImageName: "person.crop.circle.fill", profileName: "Abdoul701", imageName: "real", title: "Mallot \"Authentique\" Real", category: "Mode", price: 60),
        CardItem(profileImageName: "person.crop.circle.fill", profileName: "Palermo70", imageName: "rolex", title: "Rolex Date Just", category: "Mode", price: 10000),
        CardItem(profileImageName: "person.crop.circle.fill", profileName: "So701", imageName: "clio", title: "Clio IV GT 2019", category: "Voiture", price: 15000)
    ]
    let colums = [
        GridItem(.adaptive(minimum: 150))
    ]
    @State var showAllCirleItems:Bool = false
    @State var showAllDesireItems:Bool = false
    @State var showMenu:Bool = false
    var height = UIScreen.main.bounds.height
    var width = UIScreen.main.bounds.width
    var body: some View {
        NavigationView {
            ScrollView{
                ZStack(alignment: .leading){
                    ZStack {
                        VStack(alignment: .leading){
                            Text("Fil d'actualités")
                                .font(.title)
                                .padding()
                            Divider()
                            Button(action: {
                                //                                withAnimation {
                                self.showAllCirleItems.toggle()
                                //                                }
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
                                    }).padding(.leading)
                                }
                                .frame(height:height*0.4)
                            }
                            
                            //                            ScrollView(showAllCirleItems ? .vertical : .horizontal){
                            //                                if showAllCirleItems {
                            //                                    LazyVGrid(columns: [GridItem(),GridItem()], content: /*@START_MENU_TOKEN@*/{
                            //                                        ForEach(circleCardList){ card in
                            //                                            CardItemView(card: card)
                            //                                                .transition(.move(edge: .top))
                            //                                        }
                            //                                    })
                            //                                }else{
                            //                                    LazyHGrid(rows: [GridItem()], content:{
                            //                                        ForEach(circleCardList){ card in
                            //                                            CardItemView(card: card)
                            //                                                .transition(.move(edge: .leading))
                            //                                        }
                            //                                    }).padding(.leading)
                            //                                }
                            //                            }
                            Divider()
                            Button(action: {self.showAllDesireItems.toggle()}, label: {
                                Text("Annonces selon vous envies")
                                    .foregroundColor(.gray)
                            }).padding(.leading)
                            if showAllDesireItems {
                                ScrollView{
                                    LazyVGrid(columns: showAllDesireItems ? colums : [GridItem()], content: /*@START_MENU_TOKEN@*/{
                                        ForEach(desireCardList){ card in
                                            CardItemView(card: card)
                                        }
                                    })
                                }
                            }else{
                                ScrollView(.horizontal){
                                    LazyHGrid(rows: [GridItem()], content:{
                                        ForEach(desireCardList){ card in
                                            CardItemView(card: card)
                                        }
                                    }).frame(height:height*0.4).padding(.leading)
                                }
                            }
                            VStack(alignment: .leading){
                                Divider().padding(.top)
                                Text("Top annonces")
                                    .padding(.leading)
                                Divider()
                                Text("Nouveautés")
                                    .padding(.leading)
                            }
                        }
                        .disabled(self.showMenu ? true : false)
                        .offset(x: self.showMenu ? width/1.5 : 0)
                        if showMenu {
                            Rectangle().fill(Color.primary.opacity(0.5))
                        }else{
                            EmptyView()
                        }
                    }
                    if showMenu{
                        MenuView()
                            .frame(width: width/1.5)
                            .transition(.move(edge: .leading))
                    }
                }
            }
            .navigationBarItems(leading: Button(action: {
                withAnimation {
                    self.showMenu.toggle()
                }
            }, label: {
                Image(systemName: "slider.horizontal.3")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            }))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Circle")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576))
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
