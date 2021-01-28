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
    @State private var isSelected = false
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
            Button(action: {
                self.isSelected.toggle()
            }, label: {
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
                    Image(categoryItem.image_name)
                        .resizable()
                        .scaledToFit()
                        .frame(width: width*0.4)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white.opacity(self.isSelected ? 0.6 : 0.0))
                        )
                    if isSelected{
                        Image(systemName: "checkmark.circle.fill")
                            .font(.title2)
                            .padding(6)
                    }
                }
            })
            Text(categoryItem.category_name)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(5)
        }
        
    }
}

struct CategoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CategoryItemView(categoryItem: CategorySelection(category_id: "1", category_name: "Véhicules", image_name: "vehicules", isSelectedCategory: "1"))
        }
    }
}
