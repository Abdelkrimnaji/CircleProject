//
//  SellSubCategory.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 28/01/2021.
//

import SwiftUI

struct SellSubCategory: View {
    var subCategorySelected = "Véhicules"
    var subCategories:[[String]] = [
        ["Vêtements", "Chaussures", "Accesoires & Bagagerie", "Montres & Bijoux", "Equipement bébé", "Vêtements bébé"],
        ["Voitures", "Motos","Nautisme", "Equipements auto", "Equipements moto", "Equipements Nautisme"]
    ]
    var body: some View {
        if subCategorySelected == "Mode"{
            List(subCategories[0], id:\.self){ item in
                Text(item)
            }
        }else if subCategorySelected == "Véhicules"{
            List(subCategories[1], id:\.self){ item in
                Text(item)
            }
        }
    }
}

struct SellSubCategory_Previews: PreviewProvider {
    static var previews: some View {
        SellSubCategory()
    }
}
