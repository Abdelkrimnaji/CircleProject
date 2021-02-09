//
//  SellStep1.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 26/01/2021.
//

import SwiftUI
import MapKit

struct SellStep1: View {
    @State private var annonceTitle = ""
    @State private var annoncePrice = ""
    @State private var isOfferChecked = false
    @State private var isRequestChecked = false
    @State private var width = UIScreen.main.bounds.width
    @State private var category: SellCategory = SellCategory(name: "Vetements",children:[SellCategory(name: "Vetements"),SellCategory(name: "Chaussures")])
    @State private var manager = CLLocationManager()
    @State private var alert = false
    
    @Binding var annonceStep: Double
    
    @ObservedObject var dealOffer: Deal
    
    var body: some View {
        ScrollView{
            VStack{
                HStack {
                    Text("Annonce")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576))
                    Spacer()
                }.padding(.bottom)
                VStack(alignment: .leading){
                    Button(action: {
                        isOfferChecked.toggle()
                    }, label: {
                        HStack(alignment: .top){
                            Image(systemName: isOfferChecked ? "checkmark.circle": "circle")
                                .font(.headline)
                                .foregroundColor(Color(red: 131/255, green: 145/255, blue: 165/255))
                            VStack(alignment: .leading) {
                                Text("Offre")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                Text("Si vous souhaitez vendre un article")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }.padding(.bottom)
                    })
                    
                    HStack(alignment: .top){
                        Image(systemName: isRequestChecked ? "checkmark.circle": "circle")
                            .font(.headline)
                            .foregroundColor(Color(red: 131/255, green: 145/255, blue: 165/255))
                        VStack(alignment: .leading) {
                            Text("Demande")
                                .font(.headline)
                                .fontWeight(.bold)
                            Text("Si vous recherchez un article")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                Divider().padding(.vertical)
                NavigationLink(
                    destination: SellCategoriesView(category: $category),
                    label: {
                        HStack{
                            if let category = self.category{
                                Text(category.name)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            }else{
                                Text("Sélectionnez la catégorie")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            }
                            Image(systemName: "chevron.right")
                                .font(.title3)
                                .foregroundColor(.gray)
                        }.padding(10)
                        .frame(width: width*0.7)
                        .overlay(RoundedRectangle(cornerRadius: 2).stroke(Color.gray, lineWidth: 2))
                    })
                Divider().padding(.vertical)
                VStack{
                    HStack {
                        TextField("Titre de l'annonce", text: $dealOffer.title)
                            .font(.headline)
                            .padding(.leading, 5)
                    }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
                    .padding(.bottom)
                    Divider()
                    HStack {
                        TextField("Prix de l'annonce", text: $dealOffer.price)
                            .font(.headline)
                            .padding(.leading, 5)
                    }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
                    .padding(.top)
                }
                Divider().padding(.vertical)
                NavigationLink(
                    destination: MapView(manager: $manager, alert: $alert).alert(isPresented: $alert) {
                        Alert(title: Text("Please Enable Location Access In Settings Pannel !!!"))
                    },
                    label: {
                        HStack{
                            Text("Localisation de votre bien ?")
                                .font(.headline)
                            Image(systemName: "chevron.right")
                                .font(.title3)
                                .foregroundColor(.gray)
                        }.padding(10)
                        .frame(width: width*0.7)
                        .overlay(RoundedRectangle(cornerRadius: 2).stroke(Color.gray, lineWidth: 2))
                    })
                Divider().padding(.vertical)
                Spacer()
            }
        }
//        .onAppear {
//            annonceStep = 25
//        }
    }
}

struct SellStep1_Previews: PreviewProvider {
    static var previews: some View {
        SellStep1(annonceStep: .constant(25), dealOffer: Deal())
    }
}
