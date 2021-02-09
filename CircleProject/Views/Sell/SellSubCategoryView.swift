//
//  SellSubCategory.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 28/01/2021.
//

import SwiftUI

struct SellSubCategoryView: View {
    @Binding var category: SellCategory
    var categorySelected: SellCategory
    //    var subCategories:[[String]] = [
    //        ["Vêtements", "Chaussures", "Accesoires & Bagagerie", "Montres & Bijoux", "Equipement bébé", "Vêtements bébé"],
    //        ["Voitures", "Motos","Nautisme", "Equipements auto", "Equipements moto", "Equipements Nautisme"]
    //    ]
    @State var isSellViewPresented = false
    var body: some View {
        
        List(categorySelected.children){ item in
//            NavigationLink(destination: CreateDealView(),
//                           label: {
                            Text(item.name)
                                .onTapGesture {
                                    category = item
                                    self.isSellViewPresented.toggle()
                                }
//                           })
                .fullScreenCover(isPresented: $isSellViewPresented, content: CreateDealView.init)
        }
    }
}

struct SellSubCategory_Previews: PreviewProvider {
    static var previews: some View {
        SellSubCategoryView(category: .constant(SellCategory(name: "Vetements")), categorySelected: SellCategory(name: "Vetements"))
    }
}
