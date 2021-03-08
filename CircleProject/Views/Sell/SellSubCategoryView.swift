//
//  SellSubCategory.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 28/01/2021.
//

import SwiftUI

struct SellSubCategoryView: View {
    @State var subCategoriesList: [SubCategorySelection] = []
    @State var categoryId = ""
    @State var categoryName = ""
    @ObservedObject var dealOffer: Deal
    @Binding var shouldPopToRootView : Bool
    
    var body: some View {
        
        List(subCategoriesList, id: \.subCategoryId){ item in
                  Text(item.name)
                      .foregroundColor(.primary)
                      .onTapGesture {
                          dealOffer.categoryName = item.name
                        dealOffer.categoryId = item.subCategoryId
                          self.shouldPopToRootView = false
                      }
        }
        .onAppear{
            Api().getSubCategories(categoryId: categoryId) { (subCategories, error) in
                if error != nil{
                    print(error!.localizedDescription)
                }else if let subCategories = subCategories{
                    self.subCategoriesList = subCategories
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(categoryName)
                    .fontWeight(.bold)
                    .font(.title2)
                    .foregroundColor(Color(red: 84/255, green: 84/255, blue: 84/255))
            }
        }
    }
}

struct SellSubCategory_Previews: PreviewProvider {
    static var previews: some View {
        SellSubCategoryView(categoryId: "1", dealOffer: Deal(), shouldPopToRootView: .constant(false))
    }
}
