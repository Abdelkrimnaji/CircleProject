//
//  CategoryItemView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 19/11/2020.
//

import SwiftUI

struct CategoryItemView: View {
    var categoryItem: CategorySelection
    var width = UIScreen.main.bounds.width
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
            Image(categoryItem.image_name)
                .resizable()
                .scaledToFit()
                .frame(width: width*0.4)
                .cornerRadius(12)
//                .overlay(
//                            RoundedRectangle(cornerRadius: 12)
//                                .fill(Color.black.opacity(0.2))
//                        )
            Text(categoryItem.category_name)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(5)
//                .background(Color.black.opacity(0.2))
        }
    }
}

struct CategoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemView(categoryItem: CategorySelection(category_id: "1", category_name: "Véhicules", image_name: "vehicules"))
    }
}
