//
//  TutoCircles.swift
//  CircleProject
//
//  Created by Abdelkrim Naji on 04/01/2021.
//

import SwiftUI

struct TutoCircles: View {
     var width = UIScreen.main.bounds.width
     var height = UIScreen.main.bounds.height
    @State var tutoStep = 0
    @State var bounce = true
    var body: some View {
        NavigationView {
            ZStack {
                ZStack {
                    VStack{
                        ZStack {
                            VStack(alignment: .leading,spacing: 20){
                                VStack(spacing: 20){
                                    HStack {
                                        Text("Configurez vos cercles")
                                            .font(.title)
                                        Spacer()
                                    }.padding(.top)
                                    HStack {
                                        Text("Avec Circle vous pouvez filtrer ou diffuser chaque annonce en fonction de 4 cercles :")
                                            .font(.headline)
                                            .foregroundColor(.gray)
                                        Spacer()
                                    }
                                }.overlay(Rectangle().fill(Color(red: 233/255, green: 233/255, blue: 233/255, opacity: tutoStep != 0 ? 0.8 : 0)))
                                
                                ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                                    VStack(alignment: .leading,spacing: 10){
                                        HStack{
                                            Image(systemName: "circle.fill")
                                                .font(.custom("", fixedSize: 8))
                                                .foregroundColor(Color(red: 205/255, green: 205/255, blue: 205/255))
                                            Text("Cercle Familial")
                                                .fontWeight(.bold)
                                                .foregroundColor(Color(red: 253/255, green: 143/255, blue: 147/255))
                                        }
                                        HStack{
                                            Image(systemName: "circle.fill")
                                                .font(.custom("", fixedSize: 8))
                                                .foregroundColor(Color(red: 205/255, green: 205/255, blue: 205/255))
                                            Text("Cercle Amical")
                                                .fontWeight(.bold)
                                                .foregroundColor(Color(red: 214/255, green: 101/255, blue: 105/255))
                                        }
                                        HStack{
                                            Image(systemName: "circle.fill")
                                                .font(.custom("", fixedSize: 8))
                                                .foregroundColor(Color(red: 205/255, green: 205/255, blue: 205/255))
                                            Text("Cercle Professionnel")
                                                .fontWeight(.bold)
                                                .foregroundColor(Color(red: 235/255, green: 71/255, blue: 78/255))
                                        }
                                        HStack{
                                            Image(systemName: "circle.fill")
                                                .font(.custom("", fixedSize: 8))
                                                .foregroundColor(Color(red: 205/255, green: 205/255, blue: 205/255))
                                            Text("Cercle Public")
                                                .fontWeight(.bold)
                                                .foregroundColor(Color(red: 168/255, green: 42/255, blue: 48/255))
                                        }
                                    }.padding(.leading, width*0.15)
                                    Rectangle().fill(Color(red: 233/255, green: 233/255, blue: 233/255, opacity: tutoStep != 0 ? 0.8 : 0))
                                    if tutoStep == 1{
                                        HStack{
                                            Image(systemName: "circle.fill")
                                                .font(.custom("", fixedSize: 8))
                                                .foregroundColor(Color(red: 205/255, green: 205/255, blue: 205/255))
                                            Text("Cercle Familial")
                                                .fontWeight(.bold)
                                                .foregroundColor(Color(red: 253/255, green: 143/255, blue: 147/255))
                                        }
                                        .padding(5)
                                        .background(Color.white)
                                        .padding(.leading, width*0.14)
                                    }else if tutoStep == 2{
                                        HStack{
                                            Image(systemName: "circle.fill")
                                                .font(.custom("", fixedSize: 8))
                                                .foregroundColor(Color(red: 205/255, green: 205/255, blue: 205/255))
                                            Text("Cercle Amical")
                                                .fontWeight(.bold)
                                                .foregroundColor(Color(red: 253/255, green: 143/255, blue: 147/255))
                                        }
                                        .padding(5)
                                        .background(Color.white)
                                        .padding(.leading, width*0.15)
                                        .offset(y:30)
                                    }else if tutoStep == 3{
                                        HStack{
                                            Image(systemName: "circle.fill")
                                                .font(.custom("", fixedSize: 8))
                                                .foregroundColor(Color(red: 205/255, green: 205/255, blue: 205/255))
                                            Text("Cercle Professionnel")
                                                .fontWeight(.bold)
                                                .foregroundColor(Color(red: 253/255, green: 143/255, blue: 147/255))
                                        }
                                        .padding(5)
                                        .background(Color.white)
                                        .padding(.leading, width*0.15)
                                        .offset(y:60)
                                    }
                                }
                            }.padding()
                        }
                        ZStack{
                            Image("CercleFamille")
                                .resizable()
                                .scaledToFit()
                                .frame(width: width*0.25)
                            Image("CercleAmical")
                                .resizable()
                                .scaledToFit()
                                .frame(width: width*0.45)
                            Image("CercleProfessionnel")
                                .resizable()
                                .scaledToFit()
                                .frame(width: width*0.65)
                            Image("CerclePublic")
                                .resizable()
                                .scaledToFit()
                                .frame(width: width*0.8)
                            
                            Rectangle().fill(Color(red: 233/255, green: 233/255, blue: 233/255, opacity: tutoStep != 0 ? 0.8 : 0))
                            VStack {
                                VStack(alignment: .center) {
                                    Text("Cliquez sur le cercle !")
                                        .foregroundColor(.primary)
                                        .fontWeight(.bold)
                                    Image("arrow_down")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width:30)
                                }.opacity(tutoStep == 0 ? 0 : 1)
                                .offset(y: tutoStep == 2 ? 30 : 0)
                                .offset(y: bounce ? -2 : 0)
                                
                                if tutoStep == 1{
                                    NavigationLink(
                                        destination: CircleFamilyView(tutoStep: self.$tutoStep),
                                        label: {
                                            Image("CercleFamille")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: width*0.25)
                                                .padding(8)
                                                .background(Color.white)
                                                .clipShape(Circle())
                                        })
                                }else if tutoStep == 2{
                                    ZStack{
                                        NavigationLink(
                                            destination: CircleFriendsView(tutoStep: self.$tutoStep),
                                            label: {
                                                Circle().stroke(Color.white, lineWidth: 50)
                                                    .frame(width: width*0.4)
                                            })
                                        Image("CercleAmical")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: width*0.45)
                                            .padding(8)
                                    }
                                }else if tutoStep == 3{
                                    ZStack {
                                        NavigationLink(
                                            destination: CircleProView(tutoStep: self.$tutoStep),
                                            label: {
                                                Circle().stroke(Color.white, lineWidth: 50)
                                                    .frame(width: width*0.6)
                                            })
                                        Image("CercleProfessionnel")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: width*0.65)
                                            .padding(8)
                                    }
                                }
                            }.offset(y: -30)
                        }
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.9), {
                                self.tutoStep += 1
                            })
                        }, label: {
                            Text("Suivant")
                                .foregroundColor(.white)
                        })
                        .frame(width: width*0.8)
                        .padding()
                        .background(Color(red: 0.996, green: 0.557, blue: 0.576))
                        .cornerRadius(12)
                        .overlay(Rectangle().fill(Color(red: 233/255, green: 233/255, blue: 233/255, opacity: tutoStep != 0 ? 0.8 : 0)))
                        Spacer()
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Bienvenue sur Circle !")
                                .fontWeight(.bold)
                                .font(.largeTitle)
                                .foregroundColor(Color(red: 84/255, green: 84/255, blue: 84/255))
                        }
                    }
                }.zIndex(1.0)
                Rectangle().fill(Color(red: 233/255, green: 233/255, blue: 233/255, opacity: tutoStep != 0 ? 0.8 : 0))
                    .edgesIgnoringSafeArea(.all)
            }.onAppear(){
                print(tutoStep)
            }
        }
    }
}

struct TutoCircles_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TutoCircles()
        }
    }
}
