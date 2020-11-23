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
            Image(categoryItem.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: width*0.4)
                .cornerRadius(12)
            Text(categoryItem.name)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(5)
        }
    }
}

struct CategoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemView(categoryItem: CategorySelection(imageName: "loisirs", name: "Loisirs"))
    }
}
