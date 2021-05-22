//
//  ObjectsByCircleView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 04/05/2021.
//

import SwiftUI

struct ObjectsByCategoryView: View {
    @State var objects: [CardItem] = []
    @State var subcategoryId: String
    @State var categoryName: String
    @State private var searchText = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            VStack{
                ZStack{
                    Text(categoryName)
                        .fontWeight(.bold)
                        .font(.title2)
                        .foregroundColor(Color(red: 84/255, green: 84/255, blue: 84/255))
                    HStack {
                        Image("arrow_left")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 10)
                        if categoryName.count < 17{
                            Text("Retour")
                        }
                        Spacer()
                    }.foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576))
                    .padding(.leading)
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }.padding(.top,5)
            VStack{
                Divider()
                if objects.count > 0{
                    SearchBar(text: $searchText, placeholder: "Rechercher dans \(categoryName)")
                        .padding()
                        .background(Color.white.edgesIgnoringSafeArea(.all))
                    Divider()
                    ScrollView{
                        LazyVGrid(columns: [GridItem(),GridItem()], content: /*@START_MENU_TOKEN@*/{
                            ForEach(objects, id:\.card_id){ object in
                                CardItemView(card: object)
                            }
                        }).padding(.top)
                    }
                }else{
                    ScrollView{
                        Image("no_data")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width*0.5)
                            .padding(.top)
                        Text("Nous n'avons trouvé aucune annonces pour votre recherche")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                    }
                }
            }.background(Color.white.edgesIgnoringSafeArea(.all))
        }.onAppear{
            Api().getObjectsbyCategory(categoryId: subcategoryId, completion: { (object,error)in
                if error != nil{
                    print(error!.localizedDescription)
                }else if let object = object{
                    self.objects = object
                }
            })
        }
        .background(Color(red: 247/255, green: 247/255, blue: 247/255).edgesIgnoringSafeArea(.all))
    }
}

struct ObjectsByCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ObjectsByCategoryView(subcategoryId: "", categoryName: "")
    }
}
