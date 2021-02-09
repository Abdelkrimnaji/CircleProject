//
//  TabView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 14/11/2020.
//

import SwiftUI

struct TabUIView: View {
    @State private var isSellViewPresented = false
    var body: some View {
//        NavigationView{
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
                CreateDealView()
//                    NavigationLink(
//                        destination: SellStep1(),
//                        label: {
                            .tabItem {
                                Image(systemName: "plus.circle")
                                Text("Vendre")
                            }
//                        })
                    
                MessagesView()
                    .tabItem {
                        Image(systemName: "envelope")
                        Text("Messages")
                    }
                CircleView()
                    .tabItem {
                        //                    Image(systemName: "circle.grid.cross.fill")
                        Image("logo2")
                        //                        .padding(.top)
                        //                    Text("Circle")
                    }
            }
//            .navigationTitle("")
//            .navigationBarHidden(true)
//        }
       
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabUIView()
    }
}
