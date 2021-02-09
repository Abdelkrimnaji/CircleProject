//
//  SellCatogories.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 28/01/2021.
//

import SwiftUI

struct SellCategoriesView: View {
    @Binding var category: SellCategory
    
    var body: some View {
        List(SellCategory.categoriesList) { category in
            NavigationLink(
                destination: SellSubCategoryView(category: $category, categorySelected: category),
                label: {
                    Text(category.name)
                })
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Catégories")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(Color(red: 84/255, green: 84/255, blue: 84/255))
            }
        }
    }
}

struct SellCatogories_Previews: PreviewProvider {
    static var previews: some View {
        SellCategoriesView(category: .constant(SellCategory(name: "Vetements")))
    }
}
