//
//  CityView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 02/03/2021.
//

import SwiftUI

struct CityView: View {
    @State var city = ""
    @State var citiesList: [Departement] = []
    @State var userPosition = ""
    @State var isUserLocationViewActive : Bool = false
    
    var body: some View {
        HStack {
            TextField("Ville", text: $city)
                .font(.title2)
                .padding(.leading, 5)
        }.overlay(Rectangle().frame(width: 2, height: nil, alignment: .leading).foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576)), alignment: .leading)
        ScrollView{
            ForEach(citiesList, id: \.nom){ item in
                Text(item.nom)
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.leading)
                    .onTapGesture{
                        self.city = item.nom
                        self.citiesList.removeAll()
                        dump(item.departement["nom"])
                    }
                Divider()
            }
        }.padding(.top)
        .background(Color.gray.opacity(0.15))
        .cornerRadius(8)
        .frame(height: citiesList.isEmpty ? 0 : UIScreen.main.bounds.height*0.15)
        NavigationLink(
            destination: UserPositionView(shouldPopToRootView: self.$isUserLocationViewActive, userPosition: $userPosition),
            isActive: self.$isUserLocationViewActive
        ) {
            HStack{
                Image("pointer")
                    .foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576))
                Text(userPosition != "" ? userPosition : "Géolocalisation automatique")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .fontWeight(.light)
            }
        }
        .isDetailLink(false)
//        NavigationLink( destination: UserPositionView(shouldPopToRootView: $isUserLocationViewActive, userPosition: $userPosition), isActive: self.$isUserLocationViewActive) {
//            HStack{
//                Image("pointer")
//                    .foregroundColor(Color(red: 0.996, green: 0.557, blue: 0.576))
//             Text(userPosition != "" ? userPosition : "Géolocalisation automatique")
//                    .font(.title2)
//                    .foregroundColor(.gray)
//                    .fontWeight(.light)
//            }
//        }
//        .isDetailLink(false)
        .onChange(of: self.city, perform: { value in
            Api().getCity(city: self.city,completion: { (cities, error) in
                if error != nil{
                    print(error!.localizedDescription)
                }else if let cities = cities{
                        self.citiesList = cities
//                    dump(cities.departement.nom)
                }
            })
        })
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        CityView()
    }
}
