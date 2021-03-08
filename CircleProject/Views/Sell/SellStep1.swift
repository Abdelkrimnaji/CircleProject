//
//  SellStep1.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 26/01/2021.
//

import SwiftUI
import MapKit

struct SellStep1: View {
    @State private var isOfferChecked = false
    @State private var isRequestChecked = false
    @State private var width = UIScreen.main.bounds.width
    @State var isActive : Bool = false
    @State var isLocationViewActive : Bool = false
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
                        HStack(alignment: .top){
                            Image(systemName: isOfferChecked ? "largecircle.fill.circle": "circle")
                                .font(.headline)
                                .foregroundColor(isOfferChecked ? Color(red: 0.996, green: 0.557, blue: 0.576) : Color.gray)
                            VStack(alignment: .leading) {
                                Text("Offre")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                                Text("Si vous souhaitez vendre un article")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }.padding(.bottom)
                        .onTapGesture {
                            isOfferChecked.toggle()
                            if isOfferChecked{
                                dealOffer.type = .offre
                            }
                            isRequestChecked = false
                        }
                        HStack(alignment: .top){
                            Image(systemName: isRequestChecked ? "largecircle.fill.circle": "circle")
                                .font(.headline)
                                .foregroundColor(isRequestChecked ? Color(red: 0.996, green: 0.557, blue: 0.576) : Color.gray)
                            VStack(alignment: .leading) {
                                Text("Demande")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                                Text("Si vous recherchez un article")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }.onTapGesture {
                            isRequestChecked.toggle()
                            if isRequestChecked{
                                dealOffer.type = .demande
                            }
                            isOfferChecked = false
                        }
                }
                Divider().padding(.vertical)
                NavigationLink( destination: SellCategoriesView(rootIsActive: $isActive, dealOffer: dealOffer), isActive: self.$isActive) {
                    HStack{
                        Text(dealOffer.categoryName != "" ? dealOffer.categoryName : "Sélectionnez la catégorie")
                            .font(.headline)
                            .foregroundColor(.primary)
                        Image(systemName: "chevron.right")
                            .font(.title3)
                            .foregroundColor(.gray)
                    }.padding(10)
                    .frame(width: width*0.7)
                    .overlay(RoundedRectangle(cornerRadius: 2).stroke(Color.gray, lineWidth: 2))
                }
                .isDetailLink(false)
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
                            .keyboardType(.numberPad)
                            .font(.headline)
                            .padding(.leading, 5)
                    }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
                    .padding(.top)
                }
                Divider().padding(.vertical)
                NavigationLink( destination: LocationView(dealOffer: dealOffer, shouldPopToRootView: self.$isLocationViewActive), isActive: self.$isLocationViewActive) {
                    HStack{
                        Text(dealOffer.city != "" ? dealOffer.city : "Localisation de votre bien ?")
                            .font(.headline)
                            .foregroundColor(.primary)
                        Image(systemName: "chevron.right")
                            .font(.title3)
                            .foregroundColor(.gray)
                    }.padding(10)
                    .frame(width: width*0.7)
                    .overlay(RoundedRectangle(cornerRadius: 2).stroke(Color.gray, lineWidth: 2))
                }
                .isDetailLink(false)
                Divider().padding(.vertical)
                Spacer()
            }
        }.onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

struct SellStep1_Previews: PreviewProvider {
    static var previews: some View {
        SellStep1(dealOffer: Deal())
    }
}
