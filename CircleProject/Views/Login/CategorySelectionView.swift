//
//  CategorySelectionView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 19/11/2020.
//

import SwiftUI

struct CategorySelectionView: View {
    @State var categoryList: [CategorySelection] = []
    var width = UIScreen.main.bounds.width
    //    var tutorielStep
    var body: some View {
        NavigationView {
            ZStack{
                ZStack{
                    VStack{
                        VStack(alignment: .leading){
                            Text("Sélectionnez 4 catégories ou plus")
                                .padding()
                            LazyVGrid(columns: [GridItem(),GridItem()], content: /*@START_MENU_TOKEN@*/{
                                ForEach(categoryList, id: \.category_id){ categories in
                                    CategoryItemView(categoryItem: categories)
                                }
                            }).padding(.bottom)
                            
                        }.onAppear{
                            Api().getCategories { (categories) in
                                self.categoryList = categories
                            }
                        }
                        
                        //                        VStack(spacing: 20){
                        //                            HStack {
                        //                                Text("Configurez vos cercles")
                        //                                    .font(.title)
                        //                                Spacer()
                        //                            }.padding(.top)
                        //                            HStack {
                        //                                Text("Avec Circle vous pouvez filtrer ou diffuser chaque annonce en fonction de 4 cercles :")
                        //                                    .font(.headline)
                        //                                    .foregroundColor(.gray)
                        //                                Spacer()
                        //                            }
                        //                            VStack(alignment: .leading,spacing: 10){
                        //                                HStack{
                        //                                    Image(systemName: "circle.fill")
                        //                                        .font(.custom("", fixedSize: 8))
                        //                                        .foregroundColor(Color(red: 205/255, green: 205/255, blue: 205/255))
                        //                                    Text("Cercle Familial")
                        //                                        .fontWeight(.bold)
                        //                                        .foregroundColor(Color(red: 253/255, green: 143/255, blue: 147/255))
                        //                                }
                        //                                HStack{
                        //                                    Image(systemName: "circle.fill")
                        //                                        .font(.custom("", fixedSize: 8))
                        //                                        .foregroundColor(Color(red: 205/255, green: 205/255, blue: 205/255))
                        //                                    Text("Cercle Amical")
                        //                                        .fontWeight(.bold)
                        //                                        .foregroundColor(Color(red: 214/255, green: 101/255, blue: 105/255))
                        //                                }
                        //                                HStack{
                        //                                    Image(systemName: "circle.fill")
                        //                                        .font(.custom("", fixedSize: 8))
                        //                                        .foregroundColor(Color(red: 205/255, green: 205/255, blue: 205/255))
                        //                                    Text("Cercle Professionnel")
                        //                                        .fontWeight(.bold)
                        //                                        .foregroundColor(Color(red: 235/255, green: 71/255, blue: 78/255))
                        //                                }
                        //                                HStack{
                        //                                    Image(systemName: "circle.fill")
                        //                                        .font(.custom("", fixedSize: 8))
                        //                                        .foregroundColor(Color(red: 205/255, green: 205/255, blue: 205/255))
                        //                                    Text("Cercle Public")
                        //                                        .fontWeight(.bold)
                        //                                        .foregroundColor(Color(red: 168/255, green: 42/255, blue: 48/255))
                        //                                }
                        //                            }
                        //                            ZStack{
                        //                                ZStack {
                        //                                    Image("CercleFamille")
                        //                                        .resizable()
                        //                                        .scaledToFit()
                        //                                        .frame(width: width*0.25)
                        //                                }
                        //                                Image("CercleAmical")
                        //                                    .resizable()
                        //                                    .scaledToFit()
                        //                                    .frame(width: width*0.450)
                        //                                    .overlay(
                        //                                        VStack {
                        //                                            Text("Cliquez sur le cercle !")
                        //                                                .fontWeight(.bold)
                        //                                                .background(Color.white.opacity(0.9))
                        //                                            Image("arrow_down")
                        //                                                .resizable()
                        //                                                .scaledToFit()
                        //                                                .frame(width:30)
                        //                                                .background(Color.white.opacity(0.9))
                        //                                        }
                        //                                            ,alignment: .top)
                        //                                Image("CercleProfessionnel")
                        //                                    .resizable()
                        //                                    .scaledToFit()
                        //                                    .frame(width: width*0.65)
                        //                                Image("CerclePublic")
                        //                                    .resizable()
                        //                                    .scaledToFit()
                        //                                    .frame(width: width*0.8)
                        //                            }
                        //                        }
                                                Spacer()
                                                Button(action: {
                        
                                                }, label: {
                                                    Text("Suivant")
                                                        .foregroundColor(.white)
                                                })
                                                .frame(width: width*0.8)
                                                .padding()
                                                .background(Color(red: 0.996, green: 0.557, blue: 0.576))
                                                .cornerRadius(20)
                        Spacer()
                    }.padding()
                    //                    Rectangle().fill(Color(red: 233/255, green: 233/255, blue: 233/255, opacity: 0.7))
                }
                //                    VStack {
                //                        Text("Cliquez sur le cercle !")
                //                            .fontWeight(.bold)
                //                            .background(Color.white.opacity(0.9))
                //                        Image(systemName: "arrow.down")
                //                            .font(.title)
                //                            .background(Color.white.opacity(0.9))
                //                    }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Bienvenue sur Circle !")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .foregroundColor(Color(red: 84/255, green: 84/255, blue: 84/255))
                }
            }
        }
    }
}

struct CategorySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        CategorySelectionView()
    }
}
