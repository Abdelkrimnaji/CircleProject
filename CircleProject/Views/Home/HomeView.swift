//
//  HomeView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 08/11/2020.
//

import SwiftUI

struct HomeView: View {
    
    @State var objects: [CardItem] = []
    var desireCardList: [CardItem] = [
        CardItem(profileImage: "person.crop.circle.fill", card_id: "100", profileName: "Jo du 77", cardImage: "chemise", title: "Chemise", category: "Mode", price: "55", description: ""),
        CardItem(profileImage: "person.crop.circle.fill", card_id: "101", profileName: "Bob", cardImage: "montre", title: "Fossil", category: "Mode", price: "150", description: ""),
        CardItem(profileImage: "person.crop.circle.fill", card_id: "102", profileName: "Donald", cardImage: "2cv", title: "Citroen 2CV 1988", category: "Voiture", price: "150000", description: ""),
        CardItem(profileImage: "person.crop.circle.fill", card_id: "103", profileName: "Abdoul701", cardImage: "real", title: "Mallot \"Authentique\" Real", category: "Mode", price: "60", description: ""),
        CardItem(profileImage: "person.crop.circle.fill", card_id: "104", profileName: "Palermo70", cardImage: "rolex", title: "Rolex Date Just", category: "Mode", price: "10000", description: ""),
        CardItem(profileImage: "person.crop.circle.fill", card_id: "105", profileName: "So701", cardImage: "clio", title: "Clio IV GT 2019", category: "Voiture", price: "15000", description: "")
    ]
    let colums = [
        GridItem(.adaptive(minimum: 150))
    ]
    @State var showAllCirleItems:Bool = false
    @State var showAllDesireItems:Bool = false
    @State var showMenu:Bool = false
    var height = UIScreen.main.bounds.height
    var width = UIScreen.main.bounds.width
    @State private var isCardErrorMessage = false
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
                                self.showAllCirleItems.toggle()
                            }
                            , label: {
                                Text("Annonces selon vos cercles")
                                    .foregroundColor(.gray)
                            }).padding(.leading)
                            
                            
                            if showAllCirleItems{
                                ScrollView(.vertical){
                                    LazyVGrid(columns: [GridItem(),GridItem()], content: /*@START_MENU_TOKEN@*/{
                                        ForEach(objects, id:\.card_id){ object in
                                            CardItemView(card: object)
                                        }
                                    })
                                }
                            }else{
                                ScrollView(.horizontal){
                                    LazyHGrid(rows: [GridItem()], content:{
                                        ForEach(objects, id:\.card_id){ object in
                                            CardItemView(card: object)
                                        }
                                    })
                                    .padding(.leading)
                                    .onAppear{
                                        Api().getObjects { (object,error)  in
                                            if error != nil{
                                                self.isCardErrorMessage.toggle()
                                                
                                                print(error!.localizedDescription)
                                            }else if let object = object{
                                                self.objects = object
                                            }
                                        }
                                    }
                                }
                                .frame(height:height*0.4)
                                .alert(isPresented: $isCardErrorMessage, content: {
                                    Alert(title: Text("Erreur"), message: Text("Pas d'annonces disponible"), dismissButton: Alert.Button.default(Text("Ok"), action: nil))
                                })
                            }
                            Divider()
                            Button(action: {self.showAllDesireItems.toggle()}, label: {
                                Text("Annonces selon vous envies")
                                    .foregroundColor(.gray)
                            }).padding(.leading)
                            
                            if showAllDesireItems {
                                ScrollView{
                                    LazyVGrid(columns: showAllDesireItems ? colums : [GridItem()], content: /*@START_MENU_TOKEN@*/{
                                        ForEach(desireCardList, id:\.card_id){ card in
                                            CardItemView(card: card)
                                        }
                                    })
                                }
                            }else{
                                ScrollView(.horizontal){
                                    LazyHGrid(rows: [GridItem()], content:{
                                        ForEach(desireCardList, id:\.card_id){ card in
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
