//
//  CategorySelectionView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 19/11/2020.
//

import SwiftUI

struct CategorySelectionView: View {
    var categoryList: [CategorySelection] = [
        CategorySelection(imageName: "loisirs", name: "Loisirs"),
        CategorySelection(imageName: "mode", name: "Mode"),
        CategorySelection(imageName: "vehicules", name: "Véhicules"),
        CategorySelection(imageName: "multimedia", name: "Multimédia"),
        CategorySelection(imageName: "immobilier", name: "Immobilier"),
        CategorySelection(imageName: "maison", name: "Maison"),
        CategorySelection(imageName: "animaux", name: "Animaux"),
        CategorySelection(imageName: "divers", name: "Divers"),
    ]
    var width = UIScreen.main.bounds.width
    var body: some View {
        NavigationView {
            VStack{
                VStack(alignment: .leading){
                    Text("Sélectionnez 4 catégories ou plus")
                        .padding()
                    LazyVGrid(columns: [GridItem(),GridItem()], content: /*@START_MENU_TOKEN@*/{
                        ForEach(categoryList){ category in
                            CategoryItemView(categoryItem: category)
                        }
                    }).padding(.bottom)
                }
                Button(action: {}, label: {
                    Text("Suivant")
                        .foregroundColor(.white)
                })
                .frame(width: width*0.8)
                .padding()
                .background(Color(red: 0.996, green: 0.557, blue: 0.576))
                .cornerRadius(20)
            }
            .padding()
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
