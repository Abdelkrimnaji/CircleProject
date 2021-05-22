//
//  SearchView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 08/11/2020.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var isSelected = "byCircle"
    @State var categoriesList: [CategorySelection] = []
    @State var objects: [CardItem] = []
    @State private var isPresented = false
    @State var isCommit = UserDefaults.standard.bool(forKey: "isCommit")
    
    var body: some View {
        NavigationView{
            VStack{
                SearchBar(text: $searchText)
                    .padding()
                Divider()
                
                if searchText != ""{
                    if objects.count > 0{
                        ScrollView{
                            LazyVGrid(columns: [GridItem(),GridItem()], content: /*@START_MENU_TOKEN@*/{
                                ForEach(objects, id:\.card_id){ object in
                                    CardItemView(card: object)
                                }
                            }).padding(.top)
                        }
                    }else{
                        VStack{
                            Image("no_data")
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.width*0.5)
                                .padding(.top)
                            Text("Nous n'avons trouvé aucune annonces pour votre recherche")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                            Spacer()
                        }
                    }
                }else{
                    VStack {
                        HStack{
                            Spacer()
                            Text("Par Cercle")
                                .foregroundColor(isSelected == "byCircle" ? Color(red: 253/255, green: 143/255, blue: 147/255) : Color.primary)
                                .onTapGesture {
                                    self.isSelected = "byCircle"
                                }
                            Spacer()
                            Text("Par Catégorie")
                                .foregroundColor(isSelected == "byCategory" ? Color(red: 253/255, green: 143/255, blue: 147/255) : Color.primary)
                                .onTapGesture {
                                    self.isSelected = "byCategory"
                                }
                            Spacer()
                        }
                        HStack {
                            Rectangle().fill(isSelected == "byCircle" ? Color(red: 253/255, green: 143/255, blue: 147/255) : Color.gray).frame(width: UIScreen.main.bounds.width/2, height: 5)
                                .padding(.trailing, -5)
                            Rectangle().fill(isSelected == "byCategory" ? Color(red: 253/255, green: 143/255, blue: 147/255) : Color.gray).frame(width: UIScreen.main.bounds.width/2, height: 5)
                                .padding(.leading, -5)
                        }
                        if isSelected == "byCircle"{
                            List(CircleObject.circles.indices){ i in
                                Button(action:{
                                    self.isPresented.toggle()
                                }){
                                    HStack {
                                        CircleObject.circles[i].image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: UIScreen.main.bounds.width*0.1)
                                        Text(CircleObject.circles[i].name)
                                            .foregroundColor(CircleObject.circles[i].color)
                                            .fontWeight(.bold)
                                    }.padding(.vertical, 10)
                                }.fullScreenCover(isPresented: $isPresented) {
                                    ObjectsByCircleView(circle:CircleObject.circles[i])
                                }
                            }.listStyle(InsetListStyle())
                        }else if isSelected == "byCategory"{
                            NavigationView{
                                List(categoriesList, id: \.category_id) { category in
                                    NavigationLink(
                                        destination: SubCategoriesView(categoryId: category.category_id, categoryName: category.category_name),
                                        label: {
                                            Text(category.category_name)
                                                .foregroundColor(.primary)
                                        })
                                }.listStyle(InsetListStyle())
                                .onAppear{
                                    Api().getCategories { (categories,error)  in
                                        if error != nil{
                                            print(error!.localizedDescription)
                                        }else if let categories = categories{
                                            self.categoriesList = categories
                                        }
                                    }
                                }.navigationBarHidden(true)
                            }
                        }
                    }
                }
            }.onChange(of: searchText, perform: { value in
                print("commit \(isCommit)")
                if isCommit{
                    print("je commit")
                    Api().searchObject(object: value) { (objects, error) in
                        if error != nil{
                            print(error!.localizedDescription)
                        }else if let objects = objects{
                            self.objects = objects
                        }
                    }
                }
            })
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Rechercher")
                        .fontWeight(.bold)
                        .font(.title2)
                        .foregroundColor(Color(red: 84/255, green: 84/255, blue: 84/255))
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct SubCategoriesView: View {
    @State var subCategoriesList: [SubCategorySelection] = []
    @State var categoryId = ""
    @State var categoryName = ""
    @State private var isPresented = false
    
    var body: some View {
        List(subCategoriesList, id: \.subCategoryId){ item in
            Button(action: {
                self.isPresented.toggle()
            }, label: {
                Text(item.name)
                    .foregroundColor(.primary)
            }).fullScreenCover(isPresented: $isPresented) {
                ObjectsByCategoryView(subcategoryId: item.subCategoryId, categoryName: item.name)
            }
        }.listStyle(InsetListStyle())
        .onAppear{
            Api().getSubCategories(categoryId: categoryId) { (subCategories, error) in
                if error != nil{
                    print(error!.localizedDescription)
                }else if let subCategories = subCategories{
                    self.subCategoriesList = subCategories
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(categoryName)
                    .fontWeight(.bold)
                    .font(.subheadline)
                    .foregroundColor(Color(red: 84/255, green: 84/255, blue: 84/255))
            }
        }
    }
}
