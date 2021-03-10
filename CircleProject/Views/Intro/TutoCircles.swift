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
    var circle: CircleObject
    @State var isActive : Bool = false
    
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
                                        ForEach(CircleObject.circles.indices){ i in
                                            HStack{
                                                Image(systemName: "circle.fill")
                                                    .font(.custom("", fixedSize: 8))
                                                    .foregroundColor(Color(red: 205/255, green: 205/255, blue: 205/255))
                                                Text(CircleObject.circles[i].name)
                                                    .fontWeight(.bold)
                                                    .foregroundColor(CircleObject.circles[i].color)
                                            }
                                        }
                                    }.padding(.leading, width*0.15)
                                    
                                    Rectangle().fill(Color(red: 233/255, green: 233/255, blue: 233/255, opacity: tutoStep != 0 ? 0.8 : 0))
                                    if tutoStep != 0{
                                        VStack(alignment: .leading) {
                                            HStack{
                                                Image(systemName: "circle.fill")
                                                    .font(.custom("", fixedSize: 8))
                                                    .foregroundColor(Color(red: 205/255, green: 205/255, blue: 205/255))
                                                Text(CircleObject.circles[(tutoStep-1)].name)
                                                    .fontWeight(.bold)
                                                    .foregroundColor(CircleObject.circles[(tutoStep-1)].color)
                                            } .padding(5)
                                            .background(Color.white)
                                            .padding(.leading, width*0.15)
                                            .offset(y: tutoStep == 2 ? 30 : 0)
                                            .offset(y: tutoStep == 3 ? 60 : 0)
                                        }
                                    }
                                }
                            }.padding()
                        }
                        ZStack{
                            ForEach(CircleObject.circles.indices){ i in
                                CircleObject.circles[i].image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: width*CGFloat(CircleObject.circles[i].size))
                            }
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
                                .offset(y: tutoStep != 3 ? 30 : -20)
                        
                                if tutoStep != 0 {
                                    ZStack{
                                        NavigationLink( destination: CirclesConfigView(tutoStep: self.$tutoStep, circle: CircleObject.circles[tutoStep-1], shouldPopToRootView: self.$isActive), isActive: self.$isActive) {
                                            Circle().stroke(Color.white, lineWidth: 50)
                                                .frame(width: width*CGFloat((CircleObject.circles[tutoStep-1].size)-0.07))
                                        }
                                        .isDetailLink(false)
                                        
                                        CircleObject.circles[tutoStep-1].image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: width*CGFloat(CircleObject.circles[tutoStep-1].size))
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
            }
        }
    }
}

struct TutoCircles_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TutoCircles(circle: CircleObject(name: "Familial", image: Image("CercleFamille"), color: Color.black, type: .familial, size: 0.25))
        }
    }
}
