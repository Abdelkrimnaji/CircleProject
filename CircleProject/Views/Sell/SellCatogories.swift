//
//  SellCatogories.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 28/01/2021.
//

import SwiftUI

struct SellCatogories: View {
    var categoriesList: [sellCategory] = [
        sellCategory(name: "Mode", subCategories: ["Vêtements", "Chaussures", "Accesoires & Bagagerie", "Montres & Bijoux", "Equipement bébé", "Vêtements bébé"]),
        sellCategory(name: "Véhicules", subCategories: ["Vêtements", "Chaussures", "Accesoires & Bagagerie", "Montres & Bijoux", "Equipement bébé", "Vêtements bébé"]),
        sellCategory(name: "Multimédia", subCategories: ["Vêtements", "Chaussures", "Accesoires & Bagagerie", "Montres & Bijoux", "Equipement bébé", "Vêtements bébé"]),
        sellCategory(name: "Immobilier", subCategories: ["Vêtements", "Chaussures", "Accesoires & Bagagerie", "Montres & Bijoux", "Equipement bébé", "Vêtements bébé"]),
        sellCategory(name: "Loisirs", subCategories: ["Vêtements", "Chaussures", "Accesoires & Bagagerie", "Montres & Bijoux", "Equipement bébé", "Vêtements bébé"]),
        sellCategory(name: "Maison", subCategories: ["Vêtements", "Chaussures", "Accesoires & Bagagerie", "Montres & Bijoux", "Equipement bébé", "Vêtements bébé"]),
        sellCategory(name: "Animaux", subCategories: ["Vêtements", "Chaussures", "Accesoires & Bagagerie", "Montres & Bijoux", "Equipement bébé", "Vêtements bébé"]),
        sellCategory(name: "Immobilier", subCategories: ["Vêtements", "Chaussures", "Accesoires & Bagagerie", "Montres & Bijoux", "Equipement bébé", "Vêtements bébé"])
    ]
    var body: some View {
        List(categoriesList) { category in
            NavigationLink(
                destination: SellSubCategory(subCategorySelected: category.name),
                label: {
                    Text(category.name)
                })
        }
    }
}

struct SellCatogories_Previews: PreviewProvider {
    static var previews: some View {
        SellCatogories()
    }
}
