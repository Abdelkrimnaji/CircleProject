//
//  CategorySelectionView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 19/11/2020.
//

import SwiftUI

struct CategorySelectionView: View {
    @State var categoryList: [CategorySelection] = []
    @State var width = UIScreen.main.bounds.width
    @State private var tutorielStep = 2
    @State private var isTutoCirclesPresented = false
    @ObservedObject var user: User
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack{
                    Text("Sélectionnez 4 catégories ou plus")
                        .padding()
                    ScrollView{
                        LazyVGrid(columns: [GridItem(),GridItem()], content: /*@START_MENU_TOKEN@*/{
                            ForEach(categoryList, id: \.category_id){ categories in
                                CategoryItemView(categoryItem: categories, user: user)
                            }
                        }).padding(.bottom)
                        Spacer()
                    .onAppear{
                        Api().getCategories { (categories,error)  in
                            if error != nil{
                                print(error!.localizedDescription)
                            }else if let categories = categories{
                                self.categoryList = categories
                            }
                        }
                    }
                    Spacer()
                        Button(action: {
                            self.isTutoCirclesPresented.toggle()
                        }, label: {
                            Text("Suivant")
                                .foregroundColor(.white)
                        })
                        .fullScreenCover(isPresented: $isTutoCirclesPresented){
                            TutoCircles(circle: CircleObject.familial)
                        }
                        .frame(width: width*0.8)
                        .padding()
                        .background(Color(red: 0.996, green: 0.557, blue: 0.576))
                        .cornerRadius(12)
                }.padding()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Bienvenue sur Circle !")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .foregroundColor(Color(red: 84/255, green: 84/255, blue: 84/255))
                }
            }
        }
    }
}

struct CategorySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        CategorySelectionView(user: User())
    }
}
