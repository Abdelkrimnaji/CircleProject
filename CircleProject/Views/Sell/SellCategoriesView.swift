//
//  SellCatogories.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 28/01/2021.
//

import SwiftUI

struct SellCategoriesView: View {
    @State var categoriesList: [CategorySelection] = []
    @Binding var rootIsActive : Bool
    @ObservedObject var dealOffer: Deal
    
    var body: some View {
        List(categoriesList, id: \.category_id) { category in
            NavigationLink(
                destination: SellSubCategoryView(categoryId: category.category_id, categoryName:category.category_name, dealOffer: dealOffer, shouldPopToRootView: self.$rootIsActive),
                label: {
                    Text(category.category_name)
                        .foregroundColor(.primary)
                })
        }.onAppear{
            Api().getCategories { (categories,error)  in
                if error != nil{
                    print(error!.localizedDescription)
                }else if let categories = categories{
                    self.categoriesList = categories
                }
            }
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
        SellCategoriesView(rootIsActive: .constant(false), dealOffer: Deal())
    }
}
