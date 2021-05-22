//
//  test.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 08/05/2021.
//

import SwiftUI

struct ObjectsByCircleView: View {
    @State var objects: [CardItem] = []
    @State private var searchText = ""
    @State var circle: CircleObject
    var userId = UserDefaults.standard.string(forKey: "userId")
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            VStack{
                ZStack{
                    Text(circle.name)
                        .fontWeight(.bold)
                        .font(.title2)
                        .foregroundColor(circle.color)
                    HStack {
                        Image("arrow_left")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 10)
                        if circle.name.count < 17{
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
                    SearchBar(text: $searchText, placeholder: "Rechercher dans \(circle.name)")
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
            }
            .background(Color.white.edgesIgnoringSafeArea(.all))
        }.onAppear{
            Api().getObjectsbyCircle(circleId: circle.id,userId: userId!, completion: { (object,error)in
                if error != nil{
                    print(error!.localizedDescription)
                }else if let object = object{
                    self.objects = object
                }
            })
            print(circle.id)
        }.background(Color(red: 247/255, green: 247/255, blue: 247/255).edgesIgnoringSafeArea(.all))
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        ObjectsByCircleView(circle: CircleObject.familial)
    }
}
