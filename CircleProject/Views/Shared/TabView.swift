//
//  TabView.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 14/11/2020.
//

import SwiftUI

struct TabUIView: View {
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                switch viewRouter.currentPage {
                case .home:
                    HomeView()
                case .search:
                    SearchView()
                case .sell:
                    Text("")
                case .messages:
                    MessagesView()
                case .circle:
                    CircleView()
                }
                Spacer()
                ZStack {
                    Rectangle()
                        .frame(width: geometry.size.width, height: geometry.size.height/8)
                        .foregroundColor(Color.white)
                        .shadow(radius: 3)
                    HStack {
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .home, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "house.fill", tabName: "Accueil")
                        
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .search, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "magnifyingglass", tabName: "Rechercher")
                        
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .sell, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "plus.circle", tabName: "Vendre")
                        
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .messages, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "envelope", tabName: "Messages")
                        
                        CircleTab(viewRouter: viewRouter, assignedPage: .circle, width: geometry.size.width/5, height: geometry.size.height/20, systemIconName: "logo", tabName: "")
                    }.frame(width: geometry.size.width, height: geometry.size.height/8)
                }.padding(.top, -8)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}


struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabUIView(viewRouter: ViewRouter())
    }
}

struct TabBarIcon: View {
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    let width, height: CGFloat
    let systemIconName, tabName: String
    @State private var isMainMenuPresented = false
    
    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
        .fullScreenCover(isPresented: $isMainMenuPresented, content: CreateDealView.init)
        .padding(.horizontal, -4)
        .onTapGesture {
            viewRouter.currentPage = assignedPage
            if assignedPage == .sell{
                self.isMainMenuPresented.toggle()
            }
        }
        .foregroundColor(viewRouter.currentPage == assignedPage ? Color("AccentColor") : .gray)
    }
}

struct CircleTab: View {
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    
    let width, height: CGFloat
    let systemIconName, tabName: String
    
    var body: some View {
        VStack {
            Image(systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
        .padding(.horizontal, -4)
        .onTapGesture {
            viewRouter.currentPage = assignedPage
        }
        .foregroundColor(viewRouter.currentPage == assignedPage ? Color("AccentColor") : .gray)
    }
}

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .home
}

enum Page {
    case home
    case search
    case sell
    case messages
    case circle
}
