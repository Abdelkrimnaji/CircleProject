//
//  testObj.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 07/12/2020.
//

import SwiftUI

struct testObj: View {
    @State var categoryList: [CategorySelection] = []
    var height = UIScreen.main.bounds.height
    var width = UIScreen.main.bounds.width
    var body: some View {
        LazyVGrid(columns: [GridItem(),GridItem()], content: /*@START_MENU_TOKEN@*/{
            ForEach(categoryList, id: \.category_id){ categories in
                CategoryItemView(categoryItem: categories)
            }
        }).padding(.bottom)
        
        .onAppear{
            Api().getCategories { (categories) in
                self.categoryList = categories
            }
        }
        Spacer()
        Button(action: {

        }, label: {
            Text("Suivant")
                .foregroundColor(.white)
        })
        .frame(width: width*0.8)
        .padding()
        .background(Color(red: 0.996, green: 0.557, blue: 0.576))
        .cornerRadius(20)
    }
}

struct testObj_Previews: PreviewProvider {
    static var previews: some View {
        testObj()
    }
}
