//
//  TabView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 14/11/2020.
//

import SwiftUI

struct TabUIView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Accueil")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Rechercher")
                }
            SellView()
                .tabItem {
                    Image(systemName: "plus.circle")
                    Text("Vendre")
                }
            MessagesView()
                .tabItem {
                    Image(systemName: "envelope")
                    Text("Messages")
                }
            CircleView()
                .tabItem {
//                    Image(systemName: "circle.grid.cross.fill")
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width:10,height:10)
//                        .padding(.top)
//                    Text("Circle")
                }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabUIView()
    }
}
