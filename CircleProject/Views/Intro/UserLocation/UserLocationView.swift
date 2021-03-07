//
//  UserLocationView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 02/03/2021.
//

import SwiftUI

struct UserLocationView: View {
    @StateObject var user: User
    @State var isUserLocationViewActive = false
    
    var body: some View {
            VStack(alignment: .leading) {
                Text("Choisissez votre localisation :")
                    .font(.title2)
                    .padding(.bottom, 5)
                Text("Nous voulons nous assurer de trouver les offres les plus pertinentes pour vous.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 5)
                RegionView()
                Text("ou")
                    .foregroundColor(.gray)
                DepartmentView()
                Text("ou")
                    .foregroundColor(.gray)
                CityView()
            }.padding(.top)
    }
}

struct UserLocationView_Previews: PreviewProvider {
    static var previews: some View {
        UserLocationView(user: User())
    }
}
